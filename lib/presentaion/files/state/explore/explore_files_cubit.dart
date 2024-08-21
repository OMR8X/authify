import 'package:auhtify/Features/files/data/responses/get_all_files_response.dart';
import 'package:auhtify/Features/files/domain/entities/file.dart';
import 'package:auhtify/Features/files/domain/requests/get_all_files_request.dart';
import 'package:auhtify/Features/files/domain/usecases/get_all_files_usecase.dart';
import 'package:auhtify/core/injection/app_injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'explore_files_state.dart';

class ExploreFilesCubit extends Cubit<ExploreFilesState> {
  ExploreFilesCubit() : super(ExploreFilesLoading());

  GetAllFilesResponse response = const GetAllFilesResponse(
    isLastPage: false,
    currentPage: 1,
    files: [],
  );

  init() async {
    if (response.files.isNotEmpty) {
      emit(ExploreFilesInitial(response: response));
    } else {
      await loadFiles();
    }
  }

  loadFiles() async {
    final res = await sl<GetAllFilesUseCase>().call(
      request: GetAllFilesRequest(
        page: response.currentPage,
        perPage: 100,
      ),
    );
    res.fold(
      (l) {
        emit(ExploreFilesInitial(response: response));
      },
      (r) {
        ///
        response = r;

        ///
        emit(ExploreFilesInitial(response: r));
      },
    );
  }

  loadMoreFiles() async {
    if (response.isLastPage) return;
    final res = await sl<GetAllFilesUseCase>().call(
      request: GetAllFilesRequest(
        page: response.currentPage + 1,
        perPage: 100,
      ),
    );
    res.fold(
      (l) {
        emit(ExploreFilesInitial(response: response));
      },
      (r) {
        emit(ExploreFilesInitial(
          response: r.copyWith(files: response.files + r.files),
        ));
      },
    );
  }
}
