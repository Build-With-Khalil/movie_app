import 'package:get_it/get_it.dart';

import '../../features/auth_module/data/data_source/auth_remote_data_source.dart';
import '../../features/auth_module/data/repository/auth_repository_impl.dart';
import '../../features/auth_module/domain/repositories/auth_repository.dart';
import '../../features/auth_module/domain/usecases/login_use_case.dart';
import '../../features/auth_module/domain/usecases/sign_up_use_case.dart';
import '../../features/home_module/home/data/data_source/tv_show_remote_data_source.dart';
import '../../features/home_module/home/data/repositories/tv_shows_repository_impl.dart';
import '../../features/home_module/home/domain/repository/tv_show_repository.dart';
import '../../features/home_module/home/domain/use_case/get_tv_show_use_case.dart';
import '../../features/todo/data/data_source/remote_data_source.dart';
import '../../features/todo/data/repository/repository_impl.dart';
import '../../features/todo/domain/repository/todo_repository.dart';
import '../../features/todo/domain/use_cases/add_todo_use_case.dart';
import '../../features/todo/domain/use_cases/get_delete_todo_use_case.dart';
import '../../features/todo/domain/use_cases/get_todo_list_use_case.dart';
import '../../features/todo/domain/use_cases/get_updated_todo_use_case.dart';

final sl = GetIt.instance;

/// Initializes all dependencies using get_it.
/// This method is called at the start of the app to register all dependencies
/// for later use in the app.
void init() {
  // Auth Module
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(
    () => LoginUseCase(sl()),
  );
  sl.registerLazySingleton(
    () => SignUpUseCase(sl()),
  );

  // TV Shows Module
  sl.registerLazySingleton<TvShowRemoteDataSource>(
    () => TvShowRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<TvShowsRepository>(
    () => TvShowsRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(
    () => GetTvShowsUseCase(sl()),
  );

  // ✅ Todo Module
  sl.registerLazySingleton<TodoRemoteDataSource>(
    () => TodoRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<GetTodoListUseCase>(
    () => GetTodoListUseCase(sl()),
  );
  sl.registerLazySingleton<GetAddTodoUseCase>(
    () => GetAddTodoUseCase(sl()),
  );
  sl.registerLazySingleton<GetUpdatedTodoUseCase>(
    () => GetUpdatedTodoUseCase(sl()),
  );
  sl.registerLazySingleton<GetDeleteTodoUseCase>(
    () => GetDeleteTodoUseCase(sl()),
  );
}
