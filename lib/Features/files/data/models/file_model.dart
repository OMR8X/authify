import 'dart:io';

import 'package:auhtify/Features/files/domain/entities/file.dart';

class FileModel extends File {
  FileModel({
    required super.id,
    required super.name,
    required super.size,
    required super.extension,
  });

  factory FileModel.fromJson(Map json) {
    return FileModel(
      id: json["id"],
      name: json["name"],
      size: json["size"],
      extension: json["extension"],
    );
  }
  factory FileModel.fromEntity(File file) {
    return FileModel(
      id: file.id,
      name: file.name,
      size: file.size,
      extension: file.extension,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "size": size,
      "extension": extension,
    };
  }
}
