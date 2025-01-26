part of 'anime_lists_bloc.dart';

sealed class AnimeListsEvent extends Equatable {
  const AnimeListsEvent();

  @override
  List<Object> get props => [];
}

class LoadAnimeListEvent extends AnimeListsEvent {}
