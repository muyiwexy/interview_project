import 'package:flutter/material.dart';
import 'package:interview_project/core/assets/color_assets.dart';

class BuildMatchContainerHeader extends StatelessWidget {
  const BuildMatchContainerHeader({
    super.key,
    this.constraints,
    required this.child,
  });

  final BoxConstraints? constraints;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: constraints == null ? 44 : (constraints!.maxHeight * 0.33),
      decoration: const BoxDecoration(
        color: ColorAssets.klightGreen,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: child,
    );
  }
}
