part of 'anime_details_bloc.dart';

sealed class AnimeDetailsEvent extends Equatable {
  const AnimeDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadAnimeDetailsEvent extends AnimeDetailsEvent {
  final int id;

  const LoadAnimeDetailsEvent({required this.id});

  @override
  List<Object> get props => super.props..add(id);
}
