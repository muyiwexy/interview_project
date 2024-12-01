import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interview_project/core/assets/color_assets.dart';
import 'package:interview_project/core/assets/image_assets.dart';
import 'package:interview_project/core/utils/screen_utils.dart';
import 'package:interview_project/core/utils/texts_utils.dart';
import 'package:interview_project/features/3_score_app/data/model/incident.dart';
import 'package:interview_project/features/3_score_app/data/model/match.dart';
import 'package:interview_project/features/3_score_app/presentation/bloc/incident_bloc/incident_bloc.dart';
import 'package:interview_project/features/3_score_app/presentation/widgets/build_match_container_header.dart';

class BuildPenaltyShootOutOption extends StatelessWidget {
  const BuildPenaltyShootOutOption(
      {super.key, this.matchEvent, required this.incidentData});
  final Event? matchEvent;
  final IncidentDataLoaded incidentData;

  @override
  Widget build(BuildContext context) {
    final homelogoData = matchEvent?.homeTeam?.logo ?? "";
    final awaylogoData = matchEvent?.awayTeam?.logo ?? "";
    int awayScore = matchEvent?.awayScore?.penalties ?? 0;
    int homeScore = matchEvent?.homeScore?.penalties ?? 0;

    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 10,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      shadowColor: ColorAssets.kBlack.withOpacity(0.3),
      color: ColorAssets.kScaffoldBgCOlor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          color: ColorAssets.kScaffoldBgCOlor,
        ),
        child: Column(
          children: [
            BuildMatchContainerHeader(
              child: Row(
                children: [
                  Text(
                    "Penalty Shooutout",
                    style: TextUtils.kMediumTextstyle(color: ColorAssets.kST)
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.13,
              child: Row(
                children: [
                  Column(
                    children: [
                      _buildPenaltyScore(
                          homeScore, homelogoData, homeScore, awayScore),
                      _buildPenaltyScore(
                          awayScore, awaylogoData, homeScore, awayScore),
                    ],
                  ),
                  const SizedBox(
                    width: Spacing.x2,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        _buildPenaltyBox(true, ColorAssets.kHomePenaltyColor),
                        _buildPenaltyBox(
                            false, ColorAssets.kSubOutColor.withOpacity(0.1)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: Spacing.x3,
            ),
          ],
        ),
      ),
    );
  }

  Expanded _buildPenaltyScore(
      int score, String logo, int homeScore, int awayScore) {
    Color scoreColor;
    if (homeScore > awayScore) {
      scoreColor = (score == homeScore)
          ? ColorAssets.kSubinColor
          : ColorAssets.kSubOutColor;
    } else if (awayScore > homeScore) {
      scoreColor = (score == awayScore)
          ? ColorAssets.kSubinColor
          : ColorAssets.kSubOutColor;
    } else {
      scoreColor = ColorAssets
          .kSubinColor; // or any default color when both scores are equal
    }

    return Expanded(
      child: Center(
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.vertical,
          children: [
            Text(
              "($score)",
              style: TextUtils.kSmallTextstyle(color: scoreColor),
            ),
            Image.memory(
              base64Decode(logo),
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Expanded _buildPenaltyBox(bool isHome, Color color) {
    final scorers = incidentData.incident.data!.incidents?.where((incident) =>
        incident.incidentType == IncidentType.PENALTY_SHOOTOUT &&
        incident.isHome == isHome);
    return Expanded(
      child: Container(
        color: color,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: scorers!.map((incident) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SvgPicture.asset(
                  goalType(incident.incidentType, incident.incidentClass)),
            );
          }).toList(),
        ),
      ),
    );
  }

  String goalType(IncidentType? type, IncidentClass? incidentClass) {
    switch (type) {
      case IncidentType.GOAL:
        return ImageAssets.ball;
      case IncidentType.PENALTY_SHOOTOUT:
        switch (incidentClass) {
          case IncidentClass.SCORED:
            return ImageAssets.penaltyScored;
          case IncidentClass.MISSED:
            return ImageAssets.penaltyMissed;
          case IncidentClass.REGULAR:
            return ImageAssets.ball;
          default:
            return ImageAssets.penaltyMissed;
        }
      default:
        return ImageAssets.ball;
    }
  }
}
