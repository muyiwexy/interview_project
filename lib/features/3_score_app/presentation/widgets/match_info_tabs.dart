import 'package:flutter/material.dart';

import '../../../../core/assets/color_assets.dart';
import '../../../../core/utils/texts_utils.dart';
import 'rectangular_tab_indicator.dart';

class MatchInfoTabs extends StatelessWidget {
  const MatchInfoTabs({
    super.key,
    required this.tabBarHeight,
    required this.tabController,
  });

  final double tabBarHeight;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      width: MediaQuery.sizeOf(context).width,
      child: Container(
        color: ColorAssets.kdeepGreen,
        height: tabBarHeight,
        child: TabBar(
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          controller: tabController,
          indicator: const RectangularTabIndicator(
              color: ColorAssets.klightGreen, height: 4),
          labelColor: ColorAssets.kST,
          unselectedLabelColor: ColorAssets.kUT,
          dividerColor: Colors.transparent,
          labelStyle: TextUtils.kSemiLargeTextstyle().copyWith(height: 1.25),
          tabs: const [
            Tab(text: "Overview"),
            Tab(text: "Line-up"),
            Tab(text: "Statistics"),
            Tab(text: "Matches"),
          ],
        ),
      ),
    );
  }
}
