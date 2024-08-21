
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
