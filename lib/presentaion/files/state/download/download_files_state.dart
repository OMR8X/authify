part of 'download_files_cubit.dart';

sealed class DownloadFilesState extends Equatable {
  const DownloadFilesState();

  @override
  List<Object> get props => [];
}

final class DownloadFilesInitial extends DownloadFilesState {}
