import 'package:auhtify/core/resources/styles/colors_resources.dart';
import 'package:auhtify/presentaion/files/views/downloads_view.dart';
import 'package:auhtify/presentaion/files/views/uploads_view.dart';
import 'package:auhtify/presentaion/home/views/settings_view.dart';
import 'package:flutter/material.dart';

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
          DownloadsView(),
          UploadsView(),
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
                  controller.jumpToPage(0);
                },
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedScale(
                      scale: page == 0 ? 1.2 : 0.9,
                      duration: const Duration(milliseconds: 200),
                      child: Image.asset(
                        "assets/images/search-icon.png",
                        color: page == 0
                            ? ColorsResources.whiteText
                            : ColorsResources.lightGrey,
                        height: 19,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.jumpToPage(1);
                },
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedScale(
                      scale: page == 1 ? 1.2 : 0.9,
                      duration: const Duration(milliseconds: 200),
                      child: Image.asset(
                        "assets/images/downloads-icon.png",
                        color: page == 1
                            ? ColorsResources.whiteText
                            : ColorsResources.lightGrey,
                        height: 19,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.jumpToPage(2);
                },
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedScale(
                      scale: page == 2 ? 1.2 : 0.9,
                      duration: const Duration(milliseconds: 200),
                      child: Image.asset(
                        "assets/images/uploads-icon.png",
                        color: page == 2
                            ? ColorsResources.whiteText
                            : ColorsResources.lightGrey,
                        height: 19,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.jumpToPage(3);
                },
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedScale(
                      scale: page == 3 ? 1.2 : 0.9,
                      duration: const Duration(milliseconds: 200),
                      child: Image.asset(
                        "assets/images/settings-icon.png",
                        color: page == 3
                            ? ColorsResources.whiteText
                            : ColorsResources.lightGrey,
                        height: 19,
                      ),
                    ),
                  ],
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
