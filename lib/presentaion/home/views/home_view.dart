import 'package:auhtify/core/services/tokens/tokens_manager.dart';
import 'package:auhtify/core/widgets/ui/fields/button_widget.dart';
import 'package:auhtify/presentaion/auth/state/auth_views_manager_cubit/auth_views_manager_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../testing.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ButtonWidget(
              title: "testing download",
              onPressed: () async {
                FileDownloader().downloadFile(
                  'http://127.0.0.1:8000/api/testing-download',
                  'workfed.pdf',
                );
              },
            ),
            ButtonWidget(
              title: "update password",
              onPressed: () {
                context.read<section>().showForgetPassword();
              },
            ),
            ButtonWidget(
              title: "sign out",
              onPressed: () {
                context.read<section>().signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
