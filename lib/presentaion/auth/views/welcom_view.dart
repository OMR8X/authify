import 'dart:math';

import 'package:auhtify/core/resources/styles/colors_resources.dart';
import 'package:auhtify/core/resources/styles/sizes_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/widgets/ui/fields/button_widget.dart';
import '../../../core/widgets/ui/shapes/triangle_widget.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({
    super.key,
    required this.onPressSignUp,
    required this.onPressSignIn,
  });

  final VoidCallback onPressSignUp;
  final VoidCallback onPressSignIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Align(
            alignment: const Alignment(-0.8, -0.95),
            child: AnimatedTriangleWidget(
              width: 35,
              height: 35,
              angle: -pi / 6,
              color: ColorsResources.colors[0],
            ),
          ),
          Align(
            alignment: const Alignment(0.8, -0.8),
            child: AnimatedTriangleWidget(
              width: 35,
              height: 35,
              angle: pi / 6,
              color: ColorsResources.colors[1],
            ),
          ),
          Align(
            alignment: const Alignment(-0.7, 0.3),
            child: AnimatedTriangleWidget(
              width: 35,
              height: 35,
              angle: -pi / 10,
              color: ColorsResources.colors[2],
            ),
          ),
          Align(
            alignment: const Alignment(0.8, 0.2),
            child: AnimatedTriangleWidget(
              width: 35,
              height: 35,
              angle: pi / 7,
              color: ColorsResources.colors[3],
            ),
          ),
          Center(
            child: Column(
              children: [
                Expanded(
                  flex: 89,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Authify",
                            style: TextStyle(
                              color: ColorsResources.primary,
                              fontWeight: FontWeight.w700,
                              fontSize: 70,
                            ),
                          ),
                          const SizedBox(height: 50),
                          Image.asset("assets/images/welcome.png", width: 250),
                          const SizedBox(height: 100),
                          ButtonWidget(
                            title: "sign up",
                            foregroundColor: ColorsResources.primary,
                            textColor: ColorsResources.whiteText,
                            onPressed: () {
                              onPressSignUp();
                            },
                          ),
                          ButtonWidget(
                            title: "sign in",
                            foregroundColor: ColorsResources.grey,
                            textColor: ColorsResources.whiteText,
                            onPressed: () {
                              onPressSignIn();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 11,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
