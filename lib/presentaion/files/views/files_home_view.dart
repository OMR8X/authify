import 'package:auhtify/presentaion/files/widgets/search_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FilesHomeView extends StatefulWidget {
  const FilesHomeView({super.key});

  @override
  State<FilesHomeView> createState() => _FilesHomeViewState();
}

class _FilesHomeViewState extends State<FilesHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchBarWidget(
              onOpenIcon: () {},
              onTapSearchBar: () {},
              textEditingController: TextEditingController(),
            ),
            Expanded(
              flex: 6,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
