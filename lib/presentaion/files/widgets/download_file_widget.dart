import 'package:auhtify/Features/files/domain/entities/download_operation.dart';
import 'package:flutter/material.dart';

import '../../../Features/files/domain/entities/upload_files_operation.dart';
import '../../../core/resources/styles/colors_resources.dart';

class DownloadFileWidget extends StatelessWidget {
  const DownloadFileWidget({
    super.key,
    required this.operation,
  });

  final DownloadOperation operation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorsResources.grey,
          ),
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
            child: StreamBuilder(
              stream: operation.controller.stream.asBroadcastStream(),
              builder: (context, snapshot) {
                final state = snapshot.connectionState;
                return Column(
                  children: [
                    ///
                    Row(
                      children: [
                        Text(
                          operation.path.split('/').last,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),

                        ///
                        const Spacer(),

                        ///
                        if (state == ConnectionState.active)
                          if (state == ConnectionState.waiting)
                            const InkWell(
                              child: Icon(
                                Icons.close,
                                size: 12,
                              ),
                            ),
                      ],
                    ),

                    ///
                    if (state == ConnectionState.done)
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                "uploaded",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: ColorsResources.colors.first,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ///
                    if (state == ConnectionState.active)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: LinearProgressIndicator(
                          backgroundColor: ColorsResources.grey,
                          color: ColorsResources.primary,
                          value: snapshot.data!.percent / 100,
                        ),
                      ),

                    ///
                    if (state == ConnectionState.active)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ///
                          Text(
                            "${(snapshot.data!.percent).toStringAsFixed(2)}%",
                            style: const TextStyle(
                              fontSize: 10,
                              color: ColorsResources.whiteText2,
                            ),
                          ),

                          ///
                          // const Text(
                          //   "10 KB/s",
                          //   style: TextStyle(
                          //     fontSize: 10,
                          //     color: ColorsResources.whiteText2,
                          //   ),
                          // ),
                        ],
                      ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
