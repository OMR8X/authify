import 'package:auhtify/Features/auth/data/datasources/auth_data_source.dart';
import 'package:auhtify/Features/auth/data/datasources/auth_remote_data_source_implements.dart';
import 'package:auhtify/Features/auth/data/repositories/auth_repository_implement.dart';
import 'package:auhtify/Features/auth/domain/repositories/auth_repository.dart';
import 'package:auhtify/Features/auth/domain/usecases/change_password_usecase.dart';
import 'package:auhtify/Features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:auhtify/Features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:auhtify/Features/auth/domain/usecases/update_user_data_usecase.dart';
import 'package:auhtify/core/injection/app_injection.dart';
import 'package:auhtify/core/services/api/api_manager.dart';

import '../../Features/auth/domain/usecases/get_user_data_usecase.dart';
import '../../Features/auth/domain/usecases/sign_in_usecase.dart';
import '../../Features/auth/domain/usecases/sign_out_usecase.dart';
import '../services/api/api_client.dart';

authInjection() async {
  await injectRepositories();
  await injectDataSources();
  await injectUseCases();
}

Future<void> injectUseCases() async {
  sl.registerFactory<SignUpUseCase>(
    () => SignUpUseCase(repository: sl<AuthRepository>()),
  );
  sl.registerFactory<SignInUseCase>(
    () => SignInUseCase(repository: sl<AuthRepository>()),
  );
  sl.registerFactory<ChangePasswordUseCase>(
    () => ChangePasswordUseCase(repository: sl<AuthRepository>()),
  );
  sl.registerFactory<ForgetPasswordUseCase>(
    () => ForgetPasswordUseCase(repository: sl<AuthRepository>()),
  );
  sl.registerFactory<UpdateUserDataUseCase>(
    () => UpdateUserDataUseCase(repository: sl<AuthRepository>()),
  );
  sl.registerFactory<SignOutUseCase>(
    () => SignOutUseCase(repository: sl<AuthRepository>()),
  );
  sl.registerFactory<GetUserDataUseCase>(
    () => GetUserDataUseCase(repository: sl<AuthRepository>()),
  );
}

Future<void> injectRepositories() async {
  sl.registerFactory<AuthRepository>(
    () => AuthRepositoryImplement(
      remoteDataSource: sl<AuthRemoteDataSource>(),
    ),
  );
}

Future<void> injectDataSources() async {
  sl.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImplements(
      apiManager: sl<ApiManager>(),
    ),
  );
}
