import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interview_project/core/assets/color_assets.dart';
import 'package:interview_project/core/assets/image_assets.dart';
import 'package:interview_project/core/utils/texts_utils.dart';
import 'package:interview_project/features/3_score_app/presentation/widgets/game_state_tabs.dart';
import 'package:interview_project/features/3_score_app/presentation/widgets/matches_sliver_app_bar.dart';

import '../../../../core/utils/screen_utils.dart';

class MatchesSliverHeader extends SliverPersistentHeaderDelegate {
  final TabController tabController;
  final bool isPage;

  MatchesSliverHeader({required this.tabController, required this.isPage});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double tabBarHeight = maxExtent * 0.17;
    final double imageHeight = maxExtent * 0.83;

    // var width = MediaQuery.sizeOf(context).width;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          color: ColorAssets.kdeepGreen,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                fit: BoxFit.cover,
                height: imageHeight,
                ImageAssets.pitch,
                alignment: const Alignment(0, 0.5),
              ),
              Positioned.fill(
                child: Container(
                  color: ColorAssets.kdeepGreen.withOpacity(0.9),
                ),
              ),
              Positioned.fill(
                  child: Column(
                children: [
                  MatchesSliverAppBar(
                      width: constraints.maxWidth, maxExtent: maxExtent),
                  const SizedBox(
                    height: Spacing.x3,
                  ),
                  Expanded(
                    child: Align(
                      alignment: const Alignment(0, -0.3),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(leagues.length, (index) {
                            var league = leagues[index];
                            if (league.name.toUpperCase() ==
                                "all".toUpperCase()) {
                              return FittedBox(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: ColorAssets.klightGreen,
                                      radius: 20,
                                      child: Center(
                                          child: SvgPicture.asset(
                                              league.logoPath)),
                                    ),
                                    Text(
                                      league.name,
                                      style: TextUtils.kMediumTextstyle(
                                          color: ColorAssets.kST),
                                    ),
                                  ],
                                ),
                              );
                            }

                            return FittedBox(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: ColorAssets.kBlack,
                                    radius: 20,
                                    child: Center(
                                        child: Image.asset(league.logoPath)),
                                  ),
                                  Text(league.name,
                                      style: TextUtils.kMediumTextstyle(
                                          color: ColorAssets.kOddGrey)),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  )
                ],
              )),
              GameStateTabs(
                  tabBarHeight: tabBarHeight,
                  tabController: tabController,
                  isPage: isPage,
                  width: constraints.maxWidth),
            ],
          ),
        );
      },
    );
  }

  @override
  double get maxExtent {
    final double physicalHeight = WidgetsBinding
        .instance.platformDispatcher.views.first.physicalSize.height;
    final double devicePixelRatio =
        WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
    final double height = physicalHeight / devicePixelRatio;
    return 0.28 * height;
  }

  @override
  double get minExtent => maxExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class Leagues {
  final String name;
  final String logoPath;
  Leagues({required this.name, required this.logoPath});
}

final leagues = [
  Leagues(name: "All", logoPath: ImageAssets.all),
  Leagues(name: "EPL", logoPath: ImageAssets.epl),
  Leagues(name: "La Liga", logoPath: ImageAssets.laliga),
  Leagues(name: "Serie A", logoPath: ImageAssets.seriea),
  Leagues(name: "Bundesliga", logoPath: ImageAssets.bundesliga),
  Leagues(name: "Ligue 1", logoPath: ImageAssets.french)
];
