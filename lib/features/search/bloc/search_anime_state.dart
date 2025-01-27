part of 'search_anime_bloc.dart';

sealed class SearchAnimeState extends Equatable {
  const SearchAnimeState();

  @override
  List<Object> get props => [];
}

final class SearchAnimeInitial extends SearchAnimeState {}

final class SearchAnimeLoading extends SearchAnimeState {}

final class SearchAnimeLoaded extends SearchAnimeState {
  final List<AnimeEntity> animeList;

  const SearchAnimeLoaded({required this.animeList});

  @override
  List<Object> get props => [animeList];
}

final class SearchAnimeFailure extends SearchAnimeState {
  final Object error;

  const SearchAnimeFailure({required this.error});

  @override
  List<Object> get props => [error];
}
