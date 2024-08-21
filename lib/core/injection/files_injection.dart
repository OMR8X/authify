import 'package:auhtify/Features/files/data/repositores/files_repository_implement.dart';
import 'package:auhtify/Features/files/domain/usecases/download_file_usecase.dart';
import 'package:auhtify/core/injection/app_injection.dart';
import 'package:auhtify/core/services/api/api_manager.dart';

import '../../Features/files/data/datasources/files_remote_datasource.dart';
import '../../Features/files/data/datasources/files_remote_datasource_implements.dart';
import '../../Features/files/domain/repository/files_repository.dart';
import '../../Features/files/domain/usecases/get_all_files_usecase.dart';
import '../../Features/files/domain/usecases/upload_file_usecase.dart';

filesInjection() async {
  await injectRepositories();
  await injectDataSources();
  await injectUseCases();
}

Future<void> injectUseCases() async {
  sl.registerFactory<DownloadFileUseCase>(
    () => DownloadFileUseCase(
      repository: sl<FilesRepository>(),
    ),
  );
  sl.registerFactory<UploadFileUseCase>(
    () => UploadFileUseCase(
      repository: sl<FilesRepository>(),
    ),
  );
  sl.registerFactory<GetAllFilesUseCase>(
    () => GetAllFilesUseCase(
      repository: sl<FilesRepository>(),
    ),
  );
}

Future<void> injectRepositories() async {
  sl.registerFactory<FilesRepository>(
    () => FilesRepositoryImplement(
      remoteDataSource: sl<FilesRemoteDataSource>(),
    ),
  );
}

Future<void> injectDataSources() async {
  sl.registerFactory<FilesRemoteDataSource>(
    () => FilesRemoteDataSourceImplements(
      manager: sl<ApiManager>(),
    ),
  );
}
