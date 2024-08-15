import 'package:auhtify/Features/auth/data/datasources/auth_data_source.dart';
import 'package:auhtify/Features/auth/data/datasources/auth_remote_data_source_implements.dart';
import 'package:auhtify/Features/auth/data/repositories/auth_repository_implement.dart';
import 'package:auhtify/Features/auth/domain/repositories/auth_repository.dart';
import 'package:auhtify/Features/auth/domain/usecases/change_password_usecase.dart';
import 'package:auhtify/Features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:auhtify/Features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:auhtify/Features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:auhtify/Features/auth/domain/usecases/update_user_data_usecase.dart';
import 'package:auhtify/presentaion/auth/state/auth_views_manager_cubit/auth_views_manager_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //---- Feature : Auth  ---- //

  // Cubits :
  sl.registerFactory(() => AuthViewsManagerCubit());

  // Use Cases :
  sl.registerLazySingleton(() => SignInUsecase(authRepository: sl()));
  sl.registerLazySingleton(() => SignUpUsecase(authRepository: sl()));
  sl.registerLazySingleton(() => ChangePasswordUsecase(authRepository: sl()));
  sl.registerLazySingleton(() => UpdateUserDataUsecase(authRepository: sl()));
  sl.registerLazySingleton(() => ForgetPasswordUsecase(authRepository: sl()));

  // Repositories :
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImplement(remoteDataSource: sl()));

  // Data Sources :
  sl.registerLazySingleton(() => AuthRemoteDataSourceImplements(client: sl()));

  //----  Core  ---- //

  // Dio
  sl.registerSingleton<Dio>(Dio());
}
