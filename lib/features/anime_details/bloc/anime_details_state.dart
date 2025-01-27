// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'anime_details_bloc.dart';

sealed class AnimeDetailsState extends Equatable {
  const AnimeDetailsState();

  @override
  List<Object> get props => [];
}

final class AnimeDetailsInitial extends AnimeDetailsState {}

class AnimeDetailsLoading extends AnimeDetailsState {}

class AnimeDetailsLoaded extends AnimeDetailsState {
  final AnimeEntity animeDetails;

  const AnimeDetailsLoaded({
    required this.animeDetails,
  });

  @override
  List<Object> get props => super.props..add(animeDetails);
}

class AnimeDetailsFailure extends AnimeDetailsState {
  final Object error;

  const AnimeDetailsFailure({required this.error});

  @override
  List<Object> get props => super.props..add(error);
}
