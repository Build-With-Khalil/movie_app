part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class MoviesFetchedEvent extends MoviesEvent {
  final int page;

  const MoviesFetchedEvent({this.page = 1});

  @override
  List<Object> get props => [page];
}
