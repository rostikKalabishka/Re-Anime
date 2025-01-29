import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:re_anime_app/api/models/anime.dart';
import 'package:re_anime_app/repositories/anime/anime.dart';
import 'package:re_anime_app/utils/utils.dart';

part 'search_anime_event.dart';
part 'search_anime_state.dart';

class SearchAnimeBloc extends Bloc<SearchAnimeEvent, SearchAnimeState> {
  final AnimeRepositoryInterface _animeRepository;

  Timer? searchDebounce;
  String _currentQuery = ''; // Храним текущий запрос
  int _currentPage = 1;
  String _processingQuery = ''; // Храним обрабатываемый запрос

  List<AnimeEntity> animeList = [];

  SearchAnimeBloc({required AnimeRepositoryInterface animeRepository})
      : _animeRepository = animeRepository,
        super(SearchAnimeInitial()) {
    on<SearchAnimeQueryEvent>(_searchAnime);

    on<SearchAnimeLoadNextPageEvent>(
      _loadNextPage,
      transformer: sequential(),
    );

    on<SearchAnimeClearEvent>(_clear);
  }

  Future<void> _searchAnime(
      SearchAnimeQueryEvent event, Emitter<SearchAnimeState> emit) async {
    searchDebounce?.cancel();
    _currentQuery = event.query;

    if (_currentQuery.isEmpty) {
      animeList.clear();
      emit(SearchAnimeLoaded(animeList: []));
      return;
    }

    final completer = Completer<void>();

    searchDebounce = Timer(const Duration(milliseconds: 500), () async {
      if (_currentQuery.isEmpty) {
        animeList.clear();
        emit(SearchAnimeLoaded(animeList: []));
        completer.complete();
        return;
      }

      try {
        final animeResponse = await _animeRepository.searchAnime(
            query: _currentQuery, page: _currentPage);

        animeList = uniqueList([...animeResponse.data]);

        emit(SearchAnimeLoaded(
          animeList: List<AnimeEntity>.from(animeList),
          loadNextPage: animeResponse.pagination.canLoadNextPage,
        ));
      } catch (e) {
        emit(SearchAnimeFailure(error: e));
      }

      completer.complete();
    });

    await completer.future;
  }

  Future<void> _loadNextPage(event, emit) async {
    try {
      if (_currentPage <= 0 || _currentQuery.isEmpty) return;

      _currentPage++;

      final animeResponse = await _animeRepository.searchAnime(
          query: _currentQuery, page: _currentPage);

      if (!animeResponse.pagination.canLoadNextPage &&
          _currentPage > animeResponse.pagination.lastVisiblePage) {
        return;
      }
      animeList.addAll(uniqueList(animeResponse.data));
      emit(SearchAnimeLoaded(
          animeList: List<AnimeEntity>.from(animeList),
          loadNextPage: animeResponse.pagination.canLoadNextPage));
    } catch (e) {
      emit(SearchAnimeFailure(error: e));
    }
  }

  void clearState() {
    _currentPage = 1;
    _currentQuery = '';
    animeList.clear();
  }

  void _clear(_, emit) {
    animeList.clear();
    _currentQuery = '';
    _currentPage = 1;
    emit(SearchAnimeLoaded(animeList: []));
  }
}
