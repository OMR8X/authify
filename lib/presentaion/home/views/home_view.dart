import 'package:auhtify/core/services/tokens/tokens_manager.dart';
import 'package:auhtify/core/widgets/ui/fields/button_widget.dart';
import 'package:auhtify/presentaion/auth/state/auth_views_manager_cubit/auth_views_manager_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("everything ready"),
          ],
        ),
      ),
    );
  }
}
