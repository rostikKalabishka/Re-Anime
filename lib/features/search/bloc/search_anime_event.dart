part of 'search_anime_bloc.dart';

sealed class SearchAnimeEvent extends Equatable {
  const SearchAnimeEvent();

  @override
  List<Object> get props => [];
}

class SearchAnimeQueryEvent extends SearchAnimeEvent {
  final String query;

  const SearchAnimeQueryEvent({required this.query});

  @override
  List<Object> get props => super.props..add(query);
}
