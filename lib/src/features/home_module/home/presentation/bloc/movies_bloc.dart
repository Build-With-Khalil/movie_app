import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/src/core/response/api_response.dart';
import 'package:movie_app/src/features/home_module/home/data/repositories/movies_repositories.dart';

import '../../data/model/movies_model.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesRepository moviesRepository;
  MoviesBloc(this.moviesRepository)
      : super(
          MoviesState(
            moviesModel: ApiResponse.loading(),
          ),
        ) {
    on<MoviesFetchedEvent>(_fetchMoviesListApi);
  }
  Future<void> _fetchMoviesListApi(
    MoviesFetchedEvent event,
    Emitter<MoviesState> emit,
  ) async {
    emit(state.copyWith(
        moviesModel: ApiResponse.loading())); // Show loading state

    try {
      final value = await moviesRepository.getApi(page: event.page);
      emit(state.copyWith(moviesModel: ApiResponse.completed(value)));
    } catch (e) {
      if (kDebugMode) {
        print("Bloc Error: $e");
      }
      emit(state.copyWith(moviesModel: ApiResponse.error(e.toString())));
    }
  }
}
