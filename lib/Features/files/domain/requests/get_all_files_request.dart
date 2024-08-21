class GetAllFilesRequest {
  final int? page;
  final String? fileExtension;
  final String? search;
  final int? perPage;

  GetAllFilesRequest({
    required this.page,
     this.perPage,
    this.fileExtension,
    this.search,
  });
}
