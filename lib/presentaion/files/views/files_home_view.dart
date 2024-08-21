import 'package:auhtify/core/resources/styles/colors_resources.dart';
import 'package:auhtify/presentaion/files/state/download/download_files_cubit.dart';
import 'package:auhtify/presentaion/files/state/explore/explore_files_cubit.dart';
import 'package:auhtify/presentaion/files/widgets/search_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FilesHomeView extends StatefulWidget {
  const FilesHomeView({super.key});

  @override
  State<FilesHomeView> createState() => _FilesHomeViewState();
}

class _FilesHomeViewState extends State<FilesHomeView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    context.read<ExploreFilesCubit>().init();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // User has reached the end of the list
        context.read<ExploreFilesCubit>().loadMoreFiles();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ExploreFilesCubit, ExploreFilesState>(
          builder: (context, state) {
            if (state is ExploreFilesInitial) {
              return RefreshIndicator(
                onRefresh: () async {
                  await context.read<ExploreFilesCubit>().loadFiles();
                  return;
                },
                child: Column(
                  children: [
                    SearchBarWidget(
                      onOpenIcon: () {},
                      onTapSearchBar: () {},
                      textEditingController: TextEditingController(),
                    ),
                    Expanded(
                      flex: 6,
                      child: GridView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(10),
                        itemCount: state.response.files.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: ColorsResources.grey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {
                                  context
                                      .read<DownloadFilesCubit>()
                                      .addOperations(
                                        state.response.files[index],
                                      );
                                  Fluttertoast.showToast(
                                      msg: "starting downloading..");
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Image.asset(
                                        "assets/images/file-icon.png",
                                        color: ColorsResources.primary,
                                        height: 24,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        state.response.files[index].name,
                                        style: const TextStyle(
                                          color: ColorsResources.whiteText,
                                          fontSize: 10,
                                        ),
                                      ),
                                      Text(
                                        '${state.response.files[index].size} MB',
                                        style: const TextStyle(
                                          color: ColorsResources.whiteText2,
                                          fontSize: 8,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
