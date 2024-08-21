import 'package:auhtify/core/resources/styles/colors_resources.dart';
import 'package:auhtify/core/resources/styles/sizes_resources.dart';
import 'package:auhtify/presentaion/files/state/upload/upload_files_cubit.dart';
import 'package:auhtify/presentaion/files/views/pick_files_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/upload_file_widget.dart';

class UploadsView extends StatefulWidget {
  const UploadsView({super.key});

  @override
  State<UploadsView> createState() => _UploadsViewState();
}

class _UploadsViewState extends State<UploadsView> {
  @override
  void initState() {
    context.read<UploadFilesCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Uploads"),
        centerTitle: false,
      ),
      body: BlocBuilder<UploadFilesCubit, UploadFilesState>(
        builder: (context, state) {
          return Center(
            child: SizedBox(
              width: SizesResources.mainWidth(context),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "uploading 3 files",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => PickFilesView(
                                  afterPick: (files) {
                                    context
                                        .read<UploadFilesCubit>()
                                        .addOperations(files);
                                  },
                                ),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 6),
                            child: Text(
                              "upload files",
                              style: TextStyle(
                                color: ColorsResources.primary,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.operations.length,
                      itemBuilder: (context, index) {
                        return UploadFileWidget(
                          operation: state.operations[index],
                          onStartUplaod: () {
                            context.read<UploadFilesCubit>().startOperation(
                                  index,
                                );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
