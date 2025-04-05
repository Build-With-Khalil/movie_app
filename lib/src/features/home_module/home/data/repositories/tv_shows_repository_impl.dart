import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/failure/failure.dart';
import 'package:movie_app/src/features/home_module/home/domain/entity/tv_show_entity.dart';

import '../../domain/repository/tv_show_repository.dart';
import '../data_source/tv_show_remote_data_source.dart';

class TvShowsRepositoryImpl extends TvShowsRepository {
  final TvShowRemoteDataSource tvShowRemoteDataSource;

  TvShowsRepositoryImpl(this.tvShowRemoteDataSource);

  @override
  Future<Either<Failure, List<TvShowsEntity>>> getTvShows() async {
    try {
      final result = await tvShowRemoteDataSource.getTvShows();
      List<TvShowsEntity> tvShowsEntities =
          result.map((model) => model as TvShowsEntity).toList();
      return Right(tvShowsEntities);
    } catch (e) {
      print('Error occurred in Repository: $e'); // Log the error here
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
