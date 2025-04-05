import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/failure/failure.dart';
import 'package:movie_app/src/core/use_case/no_params.dart';

import '../../../../../core/use_case/use_case.dart';
import '../entity/tv_show_entity.dart';
import '../repository/tv_show_repository.dart';

class GetTvShowsUseCase extends UseCase<List<TvShowsEntity>, NoParams> {
  final TvShowsRepository tvShowsRepository;

  GetTvShowsUseCase(this.tvShowsRepository);

  @override
  Future<Either<Failure, List<TvShowsEntity>>> call(NoParams params) async {
    return await tvShowsRepository.getTvShows();
  }
}
