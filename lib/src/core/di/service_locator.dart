import 'package:get_it/get_it.dart';

import '../../features/auth_module/data/data_source/auth_remote_data_source.dart';
import '../../features/auth_module/data/repository/auth_repository_impl.dart';
import '../../features/auth_module/domain/repositories/auth_repository.dart';
import '../../features/auth_module/domain/usecases/login_use_case.dart';
import '../../features/home_module/home/data/data_source/tv_show_remote_data_source.dart';
import '../../features/home_module/home/data/repositories/tv_shows_repository_impl.dart';
import '../../features/home_module/home/domain/repository/tv_show_repository.dart';
import '../../features/home_module/home/domain/use_case/get_tv_show_use_case.dart';

final sl = GetIt.instance;

/// Initializes all dependencies using get_it.
/// This method is called at the start of the app to register all dependencies
/// for later use in the app.
void init() {
  // Register Dio instance created using DioClient
  // Register AuthRemoteDataSource, which will use Dio for API calls
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());

  // Register AuthRepository, which handles business logic for authentication
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Register LoginUseCase, which performs the login operation
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  // Registering remote data source
  sl.registerLazySingleton(() => TvShowRemoteDataSourceImpl());

  // Registering repository implementation
  sl.registerLazySingleton<TvShowsRepository>(
      () => TvShowsRepositoryImpl(sl()));

  // Registering use case
  sl.registerLazySingleton(() => GetTvShowsUseCase(sl()));
  sl.registerLazySingleton<TvShowRemoteDataSource>(
      () => TvShowRemoteDataSourceImpl());
}
