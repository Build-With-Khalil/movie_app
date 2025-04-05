part of 'movies_bloc.dart';

class TvShowsState extends Equatable {
  final PostAPIStatus postAPIStatus;
  final List<TvShowsEntity> tvShows;
  final String message;

  const TvShowsState({
    this.postAPIStatus = PostAPIStatus.initial,
    this.tvShows = const <TvShowsEntity>[],
    this.message = '',
  });

  TvShowsState copyWith({
    PostAPIStatus? postAPIStatus,
    List<TvShowsEntity>? tvShows,
    String? message,
  }) {
    return TvShowsState(
      postAPIStatus: postAPIStatus ?? this.postAPIStatus,
      tvShows: tvShows ?? this.tvShows,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        postAPIStatus,
        tvShows,
        message,
      ];
}
