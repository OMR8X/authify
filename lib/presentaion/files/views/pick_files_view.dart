import 'dart:io';

import 'package:auhtify/core/resources/styles/colors_resources.dart';
import 'package:auhtify/core/resources/styles/sizes_resources.dart';
import 'package:auhtify/core/widgets/ui/fields/button_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PickFilesView extends StatefulWidget {
  const PickFilesView({
    super.key,
    required this.afterPick,
  });
  final void Function(List<File>) afterPick;
  @override
  State<PickFilesView> createState() => _PickFilesViewState();
}

class _PickFilesViewState extends State<PickFilesView> {
  List<PlatformFile> files = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick Files"),
        centerTitle: false,
      ),
      body: Center(
        child: SizedBox(
          width: SizesResources.mainWidth(context),
          child: Column(
            children: [
              Container(),
              DottedBorderContainer(
                afterPick: (pickedFiles) {
                  setState(() {
                    files.addAll(pickedFiles);
                  });
                },
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  itemCount: files.length,
                  itemBuilder: (context, index) {
                    double sizeInMB = files[index].size / (1024 * 1024);
                    String formattedSize = sizeInMB.toStringAsFixed(1);
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: ColorsResources.grey),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                const SizedBox(height: 4),
                                Image.asset(
                                  "assets/images/file-icon.png",
                                  height: 24,
                                  color: ColorsResources.primary,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      files[index].name,
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '$formattedSize MB',
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: ColorsResources.whiteText2,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      files.removeAt(index);
                                    });
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    size: 12,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const SizedBox(height: 10),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ButtonWidget(
            title: "Upload selected files",
            onPressed: files.isNotEmpty
                ? () {
                    widget.afterPick(
                      files.map((e) => File(e.path!)).toList(),
                    );
                    Navigator.of(context).pop();
                  }
                : null,
          ),
        ),
      ),
    );
  }
}

class DottedBorderContainer extends StatelessWidget {
  const DottedBorderContainer({super.key, required this.afterPick});
  final void Function(List<PlatformFile>) afterPick;
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: ColorsResources.grey,
      strokeWidth: 2,
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      dashPattern: const [6, 3],
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 14),
            const Text(
              "add one or multi files to upload them",
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  allowMultiple: true,
                );
                if (result != null) {
                  afterPick(result.files);
                }
              },
              child: const Text(
                "Brows Files",
                style: TextStyle(
                  color: ColorsResources.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
