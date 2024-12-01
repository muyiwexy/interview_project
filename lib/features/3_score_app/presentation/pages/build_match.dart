import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:interview_project/core/assets/color_assets.dart';
import 'package:interview_project/core/utils/texts_utils.dart';
import 'package:interview_project/features/3_score_app/data/model/match.dart';
import 'package:interview_project/features/3_score_app/presentation/bloc/match_data_bloc/match_data_bloc.dart';

import 'match_details.dart';

class BuildMatch extends StatelessWidget {
  const BuildMatch({
    super.key,
    required this.homeTeam,
    required this.awayTeam,
    required this.state,
    required this.isPage,
  });

  final Team homeTeam;
  final Team awayTeam;
  final MatchDataLoaded state;
  final bool isPage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (isPage) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MatchDetails(
                    matchLoadedState: state,
                    isPage: true,
                  );
                },
              ),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (state.logo.data != null && state.logo.data!.isNotEmpty)
                _buildTeamInfo(
                    homeTeam.logo, homeTeam.shortName, Alignment.center),
              _buildMatchDetails(),
              if (state.logo.data != null && state.logo.data!.isNotEmpty)
                _buildTeamInfo(
                    awayTeam.logo, awayTeam.shortName, Alignment.centerRight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeamInfo(
      String? logoData, String? shortName, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          if (logoData != null && logoData.isNotEmpty)
            Image.memory(
              base64Decode(logoData),
              height: 20,
            ),
          if (shortName != null)
            Text(
              shortName,
              style: TextUtils.kMediumTextstyle(color: ColorAssets.kDarkestGrey)
                  .copyWith(fontWeight: FontWeight.w400),
            ),
        ],
      ),
    );
  }

  Widget _buildMatchDetails() {
    final homeScore = state.match.data?.event?.homeScore?.normaltime ?? 0;

    final awayScore = state.match.data?.event?.awayScore?.normaltime ?? 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "April 17, 2024",
          style: TextUtils.kSmallTextstyle(color: ColorAssets.kUT).copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "$homeScore - $awayScore",
          style: TextUtils.kSemiLargeTextstyle(color: ColorAssets.kBlack)
              .copyWith(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        Text(
          "Full-time",
          style: TextUtils.kSmallTextstyle(color: ColorAssets.kUT).copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
