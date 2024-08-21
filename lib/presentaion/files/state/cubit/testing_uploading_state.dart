part of 'testing_uploading_cubit.dart';

class TestingUploadingState extends Equatable {
  final int test;
  const TestingUploadingState(this.test);

  @override
  List<Object> get props => [test];
}

class TestingUploadingInitial extends TestingUploadingState {
  const TestingUploadingInitial(super.test);
}
