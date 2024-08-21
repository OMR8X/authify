import 'package:auhtify/presentaion/files/state/download/download_files_cubit.dart';
import 'package:auhtify/presentaion/files/widgets/download_file_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadsView extends StatefulWidget {
  const DownloadsView({super.key});

  @override
  State<DownloadsView> createState() => _DownloadsViewState();
}

class _DownloadsViewState extends State<DownloadsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Downloads"),
        centerTitle: false,
      ),
      body: BlocBuilder<DownloadFilesCubit, DownloadFilesState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.operations.length,
            itemBuilder: (context, index) {
              return DownloadFileWidget(
                operation: state.operations[index],
              );
            },
          );
        },
      ),
    );
  }
}
