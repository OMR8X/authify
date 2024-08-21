import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'testing_uploading_state.dart';

class TestingUploadingCubit extends Cubit<TestingUploadingState> {
  TestingUploadingCubit() : super(const TestingUploadingInitial(2));

  init() {
    emit(TestingUploadingInitial(Random().nextInt(23)));
  }
}
