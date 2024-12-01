import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:interview_project/core/assets/color_assets.dart';
import 'package:interview_project/core/assets/image_assets.dart';
import 'package:interview_project/core/utils/screen_utils.dart';
import 'package:interview_project/features/3_score_app/data/model/incident.dart';
import 'package:interview_project/features/3_score_app/presentation/bloc/match_data_bloc/match_data_bloc.dart';
import 'package:interview_project/features/3_score_app/presentation/widgets/match_details_sliver_appbar.dart';
import 'package:interview_project/features/3_score_app/presentation/widgets/match_info_tabs.dart';

import '../../../../core/utils/texts_utils.dart';
import '../bloc/incident_bloc/incident_bloc.dart';

class MatchesDetailsSliverHeader extends SliverPersistentHeaderDelegate {
  final TabController tabController;
  final IncidentDataLoaded state;
  final MatchDataLoaded matchLoadedState;

  MatchesDetailsSliverHeader(
      {required this.tabController,
      required this.state,
      required this.matchLoadedState});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double tabBarHeight = maxExtent * 0.15;
    final double imageHeight = maxExtent * 0.83;
    final match = matchLoadedState.match.data?.event;
    if (match == null) return Container();

    final homeTeam = match.homeTeam!;
    final awayTeam = match.awayTeam!;

    var width = MediaQuery.sizeOf(context).width;

    return Container(
      color: ColorAssets.kdeepGreen,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            fit: BoxFit.cover,
            height: imageHeight,
            ImageAssets.footballAction,
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
                MatchDetailsSliverAppBar(
                  width: width,
                  maxExtent: maxExtent,
                  state: state,
                  matchLoadedState: matchLoadedState,
                ),
                const SizedBox(
                  height: Spacing.x3,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (matchLoadedState.logo.data != null &&
                            matchLoadedState.logo.data!.isNotEmpty)
                          _buildTeamInfo(homeTeam.logo, homeTeam.shortName,
                              Alignment.topCenter, true),
                        _buildMatchDetails(),
                        if (matchLoadedState.logo.data != null &&
                            matchLoadedState.logo.data!.isNotEmpty)
                          _buildTeamInfo(awayTeam.logo, awayTeam.shortName,
                              Alignment.topRight, false),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          MatchInfoTabs(
              tabBarHeight: tabBarHeight, tabController: tabController),
        ],
      ),
    );
  }

  Widget _buildTeamInfo(
      String? logoData, String? shortName, Alignment alignment, bool isHome) {
    final scorers = state.incident.data!.incidents?.where((incident) =>
        incident.incidentType == IncidentType.GOAL &&
        incident.isHome == isHome);

    return Expanded(
      child: Align(
        alignment: alignment,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (logoData != null && logoData.isNotEmpty)
              Image.memory(
                base64Decode(logoData),
                height: 50,
              ),
            if (shortName != null)
              Text(
                shortName,
                style: TextUtils.kSemiLargeTextstyle(color: ColorAssets.kST)
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            const SizedBox(
              height: Spacing.x3,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: scorers!
                    .map(
                      (incident) => Align(
                        alignment: Alignment.center,
                        child: FittedBox(
                          child: Text.rich(
                            style: TextUtils.kMediumTextstyle(
                                color: ColorAssets.kST),
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: incident.player?.name ?? '',
                                ),
                                TextSpan(
                                  text: "  ${incident.time}'",
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchDetails() {
    var homeScore = matchLoadedState.match.data?.event?.homeScore?.penalties;
    var awayScore = matchLoadedState.match.data?.event?.awayScore?.penalties;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                style: TextUtils.kLargeTextstyle(color: ColorAssets.kST)
                    .copyWith(fontSize: 32, fontWeight: FontWeight.w600),
                text: matchLoadedState.match.data?.event?.homeScore?.normaltime
                    .toString(),
              ),
              TextSpan(
                style: TextUtils.kLargeTextstyle(color: ColorAssets.kST)
                    .copyWith(fontSize: 32, fontWeight: FontWeight.w600),
                text: " - ",
              ),
              TextSpan(
                style: TextUtils.kLargeTextstyle(
                  color: ColorAssets.kST.withOpacity(0.5),
                ).copyWith(fontSize: 32, fontWeight: FontWeight.w600),
                text: matchLoadedState.match.data?.event?.awayScore?.normaltime
                    .toString(),
              )
            ],
          ),
        ),
        if (homeScore != null)
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.vertical,
            children: [
              Text(
                "($homeScore - $awayScore)",
                style: TextUtils.kMediumTextstyle(color: ColorAssets.kUT),
              ),
              Text(
                "Penalty",
                style: TextUtils.kMediumTextstyle(color: ColorAssets.kUT),
              ),
            ],
          ),
        if (matchLoadedState.logo.data != null &&
            matchLoadedState.logo.data!.isNotEmpty)
          Expanded(
            child: Align(
              alignment: const Alignment(0, -0.3),
              child: Image.memory(
                base64Decode(matchLoadedState.logo.data!),
                height: 24,
              ),
            ),
          ),
      ],
    );
  }

  @override
  double get maxExtent {
    final double physicalHeight = WidgetsBinding
        .instance.platformDispatcher.views.first.physicalSize.height;
    final double devicePixelRatio =
        WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
    final double height = physicalHeight / devicePixelRatio;
    return 0.38 * height;
  }

  @override
  double get minExtent => maxExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
