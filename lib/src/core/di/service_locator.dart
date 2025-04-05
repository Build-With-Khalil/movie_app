import 'package:get_it/get_it.dart';

import '../../features/auth_module/login/data/data_source/auth_remote_data_source.dart';
import '../../features/auth_module/login/data/repository/auth_repository_impl.dart';
import '../../features/auth_module/login/domain/repositories/auth_repository.dart';
import '../../features/auth_module/login/domain/usecases/login_use_case.dart';

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
}
