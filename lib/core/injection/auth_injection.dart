import 'package:auhtify/Features/auth/data/datasources/auth_data_source.dart';
import 'package:auhtify/Features/auth/data/datasources/auth_remote_data_source_implements.dart';
import 'package:auhtify/Features/auth/data/repositories/auth_repository_implement.dart';
import 'package:auhtify/Features/auth/domain/repositories/auth_repository.dart';
import 'package:auhtify/Features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:auhtify/core/injection/app_injection.dart';
import 'package:auhtify/core/services/api/api_manager.dart';

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
