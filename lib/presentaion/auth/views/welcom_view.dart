import 'package:auhtify/core/resources/styles/colors_resources.dart';
import 'package:auhtify/core/resources/styles/sizes_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/ui/fields/button_widget.dart';

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
      body: Center(
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
    );
  }
}
