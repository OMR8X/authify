part of 'download_files_cubit.dart';

final class DownloadFilesState extends Equatable {
  ///
  final List<DownloadOperation> operations;

  ///
  const DownloadFilesState({
    this.operations = const [],
  });

  ///
  @override
  List<Object> get props => [operations];
}
