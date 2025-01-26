import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:re_anime_app/repositories/anime/anime.dart';

import '../../../api/models/models.dart';

part 'anime_lists_event.dart';
part 'anime_lists_state.dart';

class AnimeListsBloc extends Bloc<AnimeListsEvent, AnimeListsState> {
  final AnimeRepositoryInterface _animeRepository;
  AnimeListsBloc({required AnimeRepositoryInterface animeRepository})
      : _animeRepository = animeRepository,
        super(AnimeListsInitial()) {
    on<AnimeListsEvent>((event, emit) async {
      if (event is LoadAnimeListEvent) {
        await _loadAnimeLists(event, emit);
      }
    });
  }
  Future<void> _loadAnimeLists(LoadAnimeListEvent event, emit) async {
    emit(AnimeListsLoading());
    try {
      final seasonNowAnimeList = await _animeRepository.getSeasonNowAnimeList();
      final upcomingAnimeList = await _animeRepository.getUpcomingAnimeList();
      final movieAnimeList = await _animeRepository.getTopMovieAnime();
      // Per Second	3 requests API
      await Future.delayed(
        Duration(seconds: 1),
      );

      final popularAnimeList = await _animeRepository.getTopPopularAnime();
      emit(AnimeListsLoaded(
          upComingAnimeList: upcomingAnimeList,
          seasonNowAnimeList: seasonNowAnimeList,
          movieAnimeList: movieAnimeList,
          popularAnimeList: popularAnimeList));
    } catch (e) {
      emit(AnimeListsFailure(error: e));
    }
  }
}
