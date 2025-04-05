import 'package:dartz/dartz.dart';

import '../../../../../core/failure/failure.dart';
import '../entity/tv_show_entity.dart';

abstract class TvShowsRepository {
  Future<Either<Failure, List<TvShowsEntity>>> getTvShows();
}
