import 'dart:async';
import 'dart:io';

import 'package:auhtify/Features/files/data/datasources/files_remote_datasource.dart';
import 'package:auhtify/Features/files/data/datasources/files_remote_datasource_implements.dart';
import 'package:auhtify/Features/files/domain/requests/download_file_request.dart';
import 'package:auhtify/Features/files/domain/usecases/download_file_usecase.dart';
import 'package:auhtify/core/injection/app_injection.dart';
import 'package:auhtify/core/resources/styles/colors_resources.dart';
import 'package:auhtify/core/resources/styles/sizes_resources.dart';
import 'package:auhtify/core/services/api/api_constants.dart';
import 'package:auhtify/core/services/downloads/download_operation.dart';
import 'package:auhtify/core/widgets/ui/fields/button_widget.dart';
import 'package:auhtify/presentaion/home/views/settings_view.dart';
import 'package:auhtify/testing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

import '../../../Features/files/data/responses/download_file_response.dart';
import '../../files/views/files_home_view.dart';

class PagesHolder extends StatefulWidget {
  const PagesHolder({super.key});

  @override
  State<PagesHolder> createState() => _PagesHolderState();
}

class _PagesHolderState extends State<PagesHolder> {
  int page = 0;
  late final PageController controller;
  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (value) {
          setState(() {
            page = value;
          });
        },
        children: const [
          FilesHomeView(),
          SettingsView(),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  controller.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.decelerate,
                  );
                },
                icon: Image.asset(
                  "assets/images/search-icon.png",
                  color: page == 0
                      ? ColorsResources.whiteText
                      : ColorsResources.lightGrey,
                  height: 24,
                ),
              ),
              IconButton(
                onPressed: () async {
                  controller.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.decelerate,
                  );
                },
                icon: Image.asset(
                  "assets/images/settings-icon.png",
                  color: page == 1
                      ? ColorsResources.whiteText
                      : ColorsResources.lightGrey,
                  height: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class DownloadOperationWidget extends StatefulWidget {
//   const DownloadOperationWidget({super.key, required this.operation});
//   final DownloadOperation operation;

//   @override
//   State<DownloadOperationWidget> createState() =>
//       _DownloadOperationWidgetState();
// }

// class _DownloadOperationWidgetState extends State<DownloadOperationWidget> {
//   final controller = StreamController<DownloadFileResponse>();
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           height: 60,
//           width: SizesResources.mainWidth(context),
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: ColorsResources.grey,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               InkWell(
//                   onTap: () {
//                     widget.operation.forward(
//                       controller: controller,
//                     );
//                     setState(() {});
//                   },
//                   child: const Text("title")),
//               StreamBuilder(
//                 stream: controller.stream,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.active) {
//                     return SizedBox(
//                       width: 25,
//                       height: 25,
//                       child: CircularProgressIndicator(
//                         value: snapshot.data?.percent ?? 0,
//                       ),
//                     );
//                   }
//                   return const Text("done");
//                 },
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
