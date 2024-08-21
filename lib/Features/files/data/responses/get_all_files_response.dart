import 'package:auhtify/Features/files/data/models/file_model.dart';
import 'package:auhtify/Features/files/domain/entities/file.dart';
import 'package:equatable/equatable.dart';

class GetAllFilesResponse extends Equatable {
  final bool isLastPage;
  final int currentPage;
  final List<File> files;

  const GetAllFilesResponse({
    required this.isLastPage,
    required this.currentPage,
    required this.files,
  });

  factory GetAllFilesResponse.fromJson(Map json) {
    return GetAllFilesResponse(
      isLastPage: (json["current_page"] as int) >= (json["last_page"] as int),
      currentPage: json["current_page"],
      files: (json["data"] as List<dynamic>).map<File>((e) {
        return FileModel.fromJson(e);
      }).toList(),
    );
  }

  GetAllFilesResponse copyWith({
    bool? isLastPage,
    int? currentPage,
    List<File>? files,
  }) {
    return GetAllFilesResponse(
      isLastPage: isLastPage ?? this.isLastPage,
      currentPage: currentPage ?? this.currentPage,
      files: files ?? this.files,
    );
  }

  @override
  List<Object?> get props => [isLastPage, currentPage, files];
}
