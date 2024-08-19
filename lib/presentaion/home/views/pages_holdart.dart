import 'package:flutter/material.dart';

class PagesHolder extends StatefulWidget {
  const PagesHolder({super.key});

  @override
  State<PagesHolder> createState() => _PagesHolderState();
}

class _PagesHolderState extends State<PagesHolder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                padding: const EdgeInsets.all(20),
                icon: const Icon(Icons.home_filled),
              ),
              IconButton(
                onPressed: () {},
                padding: const EdgeInsets.all(20),
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
