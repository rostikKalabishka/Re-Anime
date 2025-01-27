import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:re_anime_app/api/models/anime.dart';
import 'package:re_anime_app/repositories/anime/anime.dart';

part 'search_anime_event.dart';
part 'search_anime_state.dart';

class SearchAnimeBloc extends Bloc<SearchAnimeEvent, SearchAnimeState> {
  final AnimeRepositoryInterface _animeRepository;

  Timer? searchDebounce;
  SearchAnimeBloc({required AnimeRepositoryInterface animeRepository})
      : _animeRepository = animeRepository,
        super(SearchAnimeInitial()) {
    on<SearchAnimeEvent>((event, emit) async {
      if (event is SearchAnimeQueryEvent) {
        await _searchAnime(event, emit);
      }
    });
  }

  Future<void> _searchAnime(SearchAnimeQueryEvent event, emit) async {
    emit(SearchAnimeLoading());
    try {
      searchDebounce?.cancel();

      final completer = Completer<void>();
      searchDebounce = Timer(const Duration(milliseconds: 200), () async {
        final animeList =
            await _animeRepository.searchAnime(query: event.query);
        emit(SearchAnimeLoaded(animeList: animeList));
        completer.complete();
      });

      await completer.future;
    } catch (e) {
      emit(SearchAnimeFailure(error: e));
    }
  }
}
