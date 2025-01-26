// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'anime_lists_bloc.dart';

sealed class AnimeListsState extends Equatable {
  const AnimeListsState();

  @override
  List<Object> get props => [];
}

final class AnimeListsInitial extends AnimeListsState {}

class AnimeListsLoading extends AnimeListsState {}

class AnimeListsLoaded extends AnimeListsState {
  final List<AnimeEntity> upComingAnimeList;
  final List<AnimeEntity> seasonNowAnimeList;
  final List<AnimeEntity> movieAnimeList;
  final List<AnimeEntity> popularAnimeList;

  const AnimeListsLoaded(
      {required this.upComingAnimeList,
      required this.seasonNowAnimeList,
      required this.movieAnimeList,
      required this.popularAnimeList});

  AnimeListsLoaded copyWith(
      {List<AnimeEntity>? upComingAnimeList,
      List<AnimeEntity>? seasonNowAnimeList,
      List<AnimeEntity>? movieAnimeList,
      List<AnimeEntity>? popularAnimeList}) {
    return AnimeListsLoaded(
        upComingAnimeList: upComingAnimeList ?? this.upComingAnimeList,
        seasonNowAnimeList: seasonNowAnimeList ?? this.seasonNowAnimeList,
        movieAnimeList: movieAnimeList ?? this.movieAnimeList,
        popularAnimeList: popularAnimeList ?? this.popularAnimeList);
  }

  @override
  List<Object> get props => super.props
    ..addAll([
      upComingAnimeList,
      seasonNowAnimeList,
      movieAnimeList,
      popularAnimeList
    ]);
}

class AnimeListsFailure extends AnimeListsState {
  final Object error;

  const AnimeListsFailure({required this.error});

  @override
  List<Object> get props => super.props..add(error);
}
