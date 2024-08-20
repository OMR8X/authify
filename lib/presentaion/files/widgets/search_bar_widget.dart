import 'package:auhtify/core/resources/styles/colors_resources.dart';
import 'package:auhtify/core/resources/styles/sizes_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.onOpenIcon,
    required this.onTapSearchBar,
    required this.textEditingController,
  });
  final VoidCallback onOpenIcon;
  final VoidCallback onTapSearchBar;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: SizesResources.mainWidth(context),
            child: TextFormField(
              ///
              controller: textEditingController,

              ///
              style: const TextStyle(fontSize: 10),

              ///
              decoration: InputDecoration(
                ///
                hintText: "Search...",

                ///
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/search-icon.png",
                    color: ColorsResources.lightGrey,
                    height: 20,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/filter-icon.png",
                    color: ColorsResources.lightGrey,
                    height: 16,
                  ),
                ),

                ///
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorsResources.grey,
                  ),
                ),

                ///
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorsResources.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
