import 'package:dashboard_for_url_shortner/core/networking/dio_factory.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/data/data_source/login_data_source.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/data/repo/login_repo_impl.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/domain/repos/login_repo.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/domain/use_cases/login_use_case.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  // Login
  _setupLoginDependencies();
}

void _setupLoginDependencies() {
  // Data Source
  getIt.registerLazySingleton<LoginDataSource>(
    () => LoginDataSource(getIt<Dio>()),
  );

  // Repository
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(getIt<LoginDataSource>()),
  );

  // Use Case
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<LoginRepo>()),
  );

  // Cubit (factory so a new instance is created each time)
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(getIt<LoginUseCase>()),
  );
}

