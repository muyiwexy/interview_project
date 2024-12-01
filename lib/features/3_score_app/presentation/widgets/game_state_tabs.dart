import 'package:flutter/material.dart';
import 'package:interview_project/core/assets/color_assets.dart';
import 'package:interview_project/core/utils/texts_utils.dart';
import 'package:interview_project/features/3_score_app/presentation/widgets/rectangular_tab_indicator.dart';

class GameStateTabs extends StatelessWidget {
  final bool isPage;
  const GameStateTabs({
    super.key,
    required this.tabBarHeight,
    required this.tabController,
    required this.isPage,
    required this.width,
  });

  final double tabBarHeight;
  final TabController tabController;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        width: width,
        child: Container(
          color: ColorAssets.kdeepGreen,
          height: tabBarHeight,
          child: TabBar(
            isScrollable: isPage,
            tabAlignment: isPage ? TabAlignment.start : null,
            controller: tabController,
            indicator:
                const RectangularTabIndicator(color: ColorAssets.klightGreen),
            labelColor: ColorAssets.kST,
            unselectedLabelColor: ColorAssets.kUT,
            dividerColor: Colors.transparent,
            labelStyle: TextUtils.kSemiLargeTextstyle().copyWith(height: 1.25),
            tabs: const [
              Tab(text: "Live matches"),
              Tab(text: "New Matches"),
              Tab(text: "Past Matches"),
            ],
          ),
        ));
  }
}
