import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'download_files_state.dart';

class DownloadFilesCubit extends Cubit<DownloadFilesState> {
  DownloadFilesCubit() : super(DownloadFilesInitial());
}
