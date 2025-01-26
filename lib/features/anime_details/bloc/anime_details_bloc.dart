import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:re_anime_app/api/models/models.dart';
import 'package:re_anime_app/repositories/anime/anime.dart';

part 'anime_details_event.dart';
part 'anime_details_state.dart';

class AnimeDetailsBloc extends Bloc<AnimeDetailsEvent, AnimeDetailsState> {
  final AnimeRepositoryInterface _animeRepository;
  AnimeDetailsBloc({required AnimeRepositoryInterface animeRepository})
      : _animeRepository = animeRepository,
        super(AnimeDetailsInitial()) {
    on<AnimeDetailsEvent>((event, emit) async {
      if (event is LoadAnimeDetailsEvent) {
        await _loadAnimeDetails(event, emit);
      }
    });
  }

  Future<void> _loadAnimeDetails(LoadAnimeDetailsEvent event, emit) async {
    emit(AnimeDetailsLoading());
    try {
      final animeDetails =
          await _animeRepository.getAnimeDetails(animeId: event.id);
      emit(
        AnimeDetailsLoaded(animeDetails: animeDetails),
      );
    } catch (e) {
      emit(
        AnimeDetailsFailure(error: e),
      );
    }
  }
}
