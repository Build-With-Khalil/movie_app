import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/use_case/no_params.dart';
import '../../../../../core/utils/enum/enums.dart';
import '../../domain/entity/tv_show_entity.dart';
import '../../domain/use_case/get_tv_show_use_case.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class TvShowsBloc extends Bloc<TvShowsEvent, TvShowsState> {
  final GetTvShowsUseCase getTvShowsUseCase;

  TvShowsBloc(this.getTvShowsUseCase) : super(const TvShowsState()) {
    on<FetchShowsEvent>(_onFetchShowsEvent);
  }

  Future<void> _onFetchShowsEvent(
    FetchShowsEvent event,
    Emitter<TvShowsState> emit,
  ) async {
    emit(
      state.copyWith(
        postAPIStatus: PostAPIStatus.loading,
      ),
    );
    final result = await getTvShowsUseCase.call(NoParams());
    result.fold(
      (failure) {
        print('Error occurred: ${failure.message}');
        emit(
          state.copyWith(
            postAPIStatus: PostAPIStatus.error,
            message: failure.message,
          ),
        );
      },
      (tvShows) {
        print('Fetched TV Shows: $tvShows');
        emit(
          state.copyWith(
            postAPIStatus: PostAPIStatus.success,
            tvShows: tvShows,
          ),
        );
      },
    );
  }
}
