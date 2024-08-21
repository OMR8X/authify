import 'dart:async';
import 'dart:io';

import 'package:auhtify/Features/files/data/datasources/files_remote_datasource.dart';
import 'package:auhtify/Features/files/domain/requests/upload_file_request.dart';
import 'package:auhtify/core/injection/app_injection.dart';
import 'package:auhtify/core/resources/styles/colors_resources.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Features/files/data/responses/upload_file_response.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: false,
      ),
      body: Column(
        children: [
          SettingItemWidget(
            title: "update user data",
            onTap: () {},
          ),
          SettingItemWidget(
            title: "change password",
            onTap: () {},
          ),
          SettingItemWidget(
            title: "log out",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class SettingItemWidget extends StatelessWidget {
  const SettingItemWidget({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onTap: () async {
          // final file = await ImagePicker().pickImage(
          //   source: ImageSource.gallery,
          // );
          // if (file != null) {
          //   sl<FilesRemoteDataSource>().uploadFile(
          //     request: UploadFileRequest(
          //       file: File(file.path),
          //       fileName: "12daws.pdf",
          //       controller: StreamController<UploadFileResponse>(),
          //       cancelToken: CancelToken(),
          //     ),
          //   );
          // }
        },
        tileColor: Colors.transparent,
        title: Text(title),
      ),
    );
  }
}
