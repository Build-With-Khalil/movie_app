part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final ApiResponse<MovieModel> moviesModel;

  const MoviesState({
    required this.moviesModel,
  });
  MoviesState copyWith({
    ApiResponse<MovieModel>? moviesModel,
  }) {
    return MoviesState(
      moviesModel: moviesModel ?? this.moviesModel,
    );
  }

  @override
  List<Object?> get props => [moviesModel];
}
