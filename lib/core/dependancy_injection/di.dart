import 'package:dashboard_for_url_shortner/core/networking/dio_factory.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/data/data_source/login_data_source.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/data/repo/login_repo_impl.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/domain/repos/login_repo.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/domain/use_cases/login_use_case.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/data/data_source/sign_up_data_source.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/data/repo/sign_up_repo_impl.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/domain/repo/sign_up_repo.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/domain/use_case/sign_up_use_case.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/presentation/cubit/signup_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  // Login
  _setupLoginDependencies();
  // Sign Up
  _setupSignUpDependencies();
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

void _setupSignUpDependencies() {
  getIt.registerLazySingleton<SignUpDataSource>(
        () => SignUpDataSource(getIt<Dio>()),
  );

  getIt.registerLazySingleton<SignUpRepo>(
        () => SignUpRepoImpl(getIt<SignUpDataSource>()),
  );

  getIt.registerLazySingleton<SignUpUseCase>(
        () => SignUpUseCase(getIt<SignUpRepo>()),
  );

  getIt.registerFactory<SignupCubit>(
        () => SignupCubit(getIt<SignUpUseCase>()),
  );
}

