import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:re_anime_app/api/models/anime.dart';
import 'package:re_anime_app/repositories/anime/anime.dart';
import 'package:re_anime_app/utils/utils.dart';

part 'search_anime_event.dart';
part 'search_anime_state.dart';

class SearchAnimeBloc extends Bloc<SearchAnimeEvent, SearchAnimeState> {
  final AnimeRepositoryInterface _animeRepository;

  Timer? searchDebounce;
  String _currentQuery = '';
  int _currentPage = 1;

  List<AnimeEntity> animeList = [];

  SearchAnimeBloc({required AnimeRepositoryInterface animeRepository})
      : _animeRepository = animeRepository,
        super(SearchAnimeInitial()) {
    on<SearchAnimeEvent>((event, emit) async {
      if (event is SearchAnimeQueryEvent) {
        await _searchAnime(event, emit);
      } else if (event is SearchAnimeLoadNextPageEvent) {
        await _loadNextPage(event, emit);
      }
    });
  }

  Future<void> _searchAnime(SearchAnimeQueryEvent event, emit) async {
    emit(SearchAnimeLoading());
    try {
      searchDebounce?.cancel();
      final completer = Completer<void>();
      searchDebounce = Timer(const Duration(milliseconds: 200), () async {
        _currentQuery = event.query;
        clearState();

        final animeResponse = await _animeRepository.searchAnime(
            query: _currentQuery, page: _currentPage);
        animeList.addAll(uniqueList([...animeResponse.data]));
        emit(SearchAnimeLoaded(
            animeList: List<AnimeEntity>.from(animeList),
            loadNextPage: animeResponse.pagination.canLoadNextPage));
        completer.complete();
      });

      await completer.future;
    } catch (e) {
      emit(SearchAnimeFailure(error: e));
    }
  }

  Future<void> _loadNextPage(event, emit) async {
    try {
      if (_currentPage <= 0) return;
      _currentPage++;
      final animeResponse = await _animeRepository.searchAnime(
          query: _currentQuery, page: _currentPage);

      if (!animeResponse.pagination.canLoadNextPage &&
          _currentPage > animeResponse.pagination.lastVisiblePage) {
        return;
      }
      animeList = List<AnimeEntity>.from(animeList)
        ..addAll(uniqueList(animeResponse.data));
      emit(SearchAnimeLoaded(
          animeList: animeList,
          loadNextPage: animeResponse.pagination.canLoadNextPage));
    } catch (e) {
      emit(SearchAnimeFailure(error: e));
    }
  }

  void clearState() {
    _currentPage = 1;
    animeList.clear();
  }
}
