import 'package:auhtify/core/injection/app_injection.dart';
import 'package:auhtify/core/resources/styles/colors_resources.dart';
import 'package:auhtify/core/services/tokens/tokens_manager.dart';
import 'package:auhtify/presentaion/auth/state/auth_views_manager_cubit/auth_views_manager_cubit.dart';
import 'package:auhtify/presentaion/auth/views/auth_views_manager.dart';
import 'package:auhtify/presentaion/files/state/explore/explore_files_cubit.dart';
import 'package:auhtify/testing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentaion/files/state/download/download_files_cubit.dart';
import 'presentaion/files/state/upload/upload_files_cubit.dart';
import 'presentaion/files/views/files_home_view.dart';

void main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();
  //
  await appInjection();
  //
  await TokenManager.instance.init();
  //
  runApp(const AuthifyApp());
}

class AuthifyApp extends StatelessWidget {
  const AuthifyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: ColorsResources.primary,
        fontFamily: "Ubuntu",
        scaffoldBackgroundColor: ColorsResources.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorsResources.background,
          titleTextStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(
            color: ColorsResources.whiteText,
            fontFamily: 'Ubuntu',
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorsResources.grey,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(create: (context) => UploadFilesCubit()),
          BlocProvider(create: (context) => ExploreFilesCubit()),
          BlocProvider(create: (context) => DownloadFilesCubit()),
        ],
        child: const AuthViewsManager(),
      ),
    );
  }
}
