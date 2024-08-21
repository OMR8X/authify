part of 'upload_files_cubit.dart';

final class UploadFilesState extends Equatable {
  ///
  final List<UploadFileOperation> operations;

  ///
  const UploadFilesState({
    this.operations = const [],
  });

  ///
  @override
  List<Object> get props => [operations];
}


