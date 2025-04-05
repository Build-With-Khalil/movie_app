part of 'movies_bloc.dart';

abstract class TvShowsEvent extends Equatable {
  const TvShowsEvent();

  @override
  List<Object?> get props => [];
}

// Event to fetch shows
class FetchShowsEvent extends TvShowsEvent {}
