part of 'explore_files_cubit.dart';

class ExploreFilesState extends Equatable {
  const ExploreFilesState();

  @override
  List<Object> get props => [];
}

final class ExploreFilesLoading extends ExploreFilesState {}

final class ExploreFilesInitial extends ExploreFilesState {
  final GetAllFilesResponse response;

  const ExploreFilesInitial({
    required this.response,
  });
  @override
  List<Object> get props => [response];
}
