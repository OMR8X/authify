import 'dart:io';

import 'package:auhtify/Features/files/domain/entities/upload_files_operation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'upload_files_state.dart';

class UploadFilesCubit extends Cubit<UploadFilesState> {
  UploadFilesCubit() : super(const UploadFilesState());
  List<UploadFileOperation> operations = [];

  init() {
    emit(UploadFilesState(operations: operations));
  }

  addOperations(List<File> files) async {
    ///
    List<UploadFileOperation> list = files.map((e) {
      return UploadFileOperation(
        file: e,
        name: e.path.split("/").last.split('.').first,
      );
    }).toList();
    //
    operations += list;
    //
    emit(UploadFilesState(operations: List.from(operations)));
  }

  startOperation(int operationId) {
    ///
    operations[operationId].forward();

    ///
    emit(UploadFilesState(operations: operations));
  }

  cancelOperation(int operationId) {
    ///
    operations[operationId].cancel();

    ///
    emit(UploadFilesState(operations: operations));
  }
}
