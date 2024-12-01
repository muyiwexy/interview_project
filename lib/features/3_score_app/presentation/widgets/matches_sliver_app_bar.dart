import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interview_project/core/assets/color_assets.dart';
import 'package:interview_project/core/assets/image_assets.dart';
import 'package:interview_project/core/utils/texts_utils.dart';

class MatchesSliverAppBar extends StatelessWidget {
  const MatchesSliverAppBar({
    super.key,
    required this.width,
    required this.maxExtent,
  });

  final double width;
  final double maxExtent;

  @override
  Widget build(BuildContext context) {
    final height = maxExtent * 0.5;
    double titleSpacing = -30;
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: SvgPicture.asset(ImageAssets.menu),
            color: ColorAssets.kST,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Image.asset(
        ImageAssets.logo,
        height: height,
      ),
      titleSpacing: titleSpacing,
      actions: [_actionTextField()],
    );
  }

  Container _actionTextField() {
    double containerWidth = width * 0.32;
    double containerHeight = kToolbarHeight * 0.7;
    int lines = 1;
    double textHeight = 0;
    double radius = 10;
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: containerWidth,
      height: containerHeight,
      child: TextFormField(
        cursorColor: ColorAssets.klightGreen,
        style: TextUtils.kMediumTextstyle(color: ColorAssets.kST)
            .copyWith(height: textHeight),
        maxLines: lines,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(right: 10),
          prefixIcon: const Icon(
            Icons.search,
            color: ColorAssets.kUT,
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 40),
          hintText: "Search...",
          hintStyle:
              TextUtils.kSemiLargeTextstyle().copyWith(height: textHeight),
          hintMaxLines: lines,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: ColorAssets.kUT,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
        ),
      ),
    );
  }
}
