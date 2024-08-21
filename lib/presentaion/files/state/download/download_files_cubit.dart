import 'dart:io' as io;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../Features/files/domain/entities/download_operation.dart';
import '../../../../Features/files/domain/entities/file.dart';

part 'download_files_state.dart';

class DownloadFilesCubit extends Cubit<DownloadFilesState> {
  DownloadFilesCubit() : super(const DownloadFilesState());

  List<DownloadOperation> operations = [];

  init() {
    emit(DownloadFilesState(operations: operations));
  }

  addOperations(File file) async {
    ///
    final directory = await getApplicationDocumentsDirectory();
    //
    operations.add(
      DownloadOperation(
        path: '${directory.path}/file-${DateTime.now().millisecond}.pdf',
        fileId: file.id.toString(),
        name: file.name,
      )..forward(),
    );
    //
    emit(DownloadFilesState(operations: List.from(operations)));
  }

  startOperation(int operationId) {
    ///
    operations[operationId].forward();

    ///
    emit(DownloadFilesState(operations: operations));
  }

  cancelOperation(int operationId) {
    ///
    operations[operationId].cancel();

    ///
    emit(DownloadFilesState(operations: operations));
  }
}
