import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:interview_project/core/assets/color_assets.dart';
import 'package:interview_project/core/utils/screen_utils.dart';
import 'package:interview_project/core/utils/texts_utils.dart';
import 'package:interview_project/features/3_score_app/data/model/best_player_model.dart'
    as best;
import 'package:interview_project/features/3_score_app/data/model/match.dart';
import 'package:interview_project/features/3_score_app/presentation/bloc/match_data_bloc/match_data_bloc.dart';
import 'package:interview_project/features/3_score_app/presentation/widgets/build_match_container_header.dart';

class BuildManOfTheMatch extends StatelessWidget {
  final MatchDataLoaded matchDataState;

  const BuildManOfTheMatch({super.key, required this.matchDataState});

  @override
  Widget build(BuildContext context) {
    var bestPlayer = parseAndCompare(
      matchDataState.bestPlayerModel.data?.bestHomeTeamPlayer,
      matchDataState.bestPlayerModel.data?.bestAwayTeamPlayer,
      matchDataState.match.data?.event?.homeTeam,
      matchDataState.match.data?.event?.awayTeam,
    );

    best.Player player = bestPlayer['player'];
    double playerRating = bestPlayer['value'];
    String playerTeamLogo = bestPlayer['teamLogo'];
    // String playerTeamName = bestPlayer['teamName'];
    String playerTeamShortName = bestPlayer['teamShortName'];

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
                    "Player of The Match",
                    style: TextUtils.kMediumTextstyle(color: ColorAssets.kST)
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Image.memory(base64Decode(playerTeamLogo)),
              ),
              title: Text(
                player.shortName ?? "",
                overflow: TextOverflow.ellipsis,
                style: TextUtils.kSemiLargeTextstyle(color: ColorAssets.kBlack)
                    .copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              subtitle: Row(
                // crossAxisAlignment: Croos.end,
                children: [
                  Image.memory(
                    base64Decode(playerTeamLogo),
                    height: 20,
                  ),
                  Flexible(
                    child: Text(
                      playerTeamShortName,
                      overflow: TextOverflow.ellipsis,
                      style: TextUtils.kMediumTextstyle(
                              color: ColorAssets.kDarkGrey)
                          .copyWith(
                              fontWeight: FontWeight.w500, letterSpacing: 0.1),
                    ),
                  ),
                ],
              ),
              trailing: IntrinsicHeight(
                child: Container(
                  width: 33,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorAssets.klightGreen,
                  ),
                  child: Center(
                    child: Text(
                      playerRating.toString(),
                      style: TextUtils.kSmallTextstyle(color: ColorAssets.kST)
                          .copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
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

  Map<String, dynamic> parseAndCompare(
    best.BestTeamPlayer? homeTeam,
    best.BestTeamPlayer? awayTeam,
    Team? homeTeamData,
    Team? awayTeamData,
  ) {
    final bestHomeTeamPlayer = homeTeam ?? best.BestTeamPlayer();
    final bestAwayTeamPlayer = awayTeam ?? best.BestTeamPlayer();

    double homeValue = double.tryParse(bestHomeTeamPlayer.value ?? '0') ?? 0.0;
    double awayValue = double.tryParse(bestAwayTeamPlayer.value ?? '0') ?? 0.0;

    if (homeValue > awayValue) {
      return {
        'player': bestHomeTeamPlayer.player,
        'value': homeValue,
        'teamLogo': homeTeamData?.logo,
        'teamName': homeTeamData?.name,
        'teamShortName': homeTeamData?.shortName,
      };
    } else {
      return {
        'player': bestAwayTeamPlayer.player,
        'value': awayValue,
        'teamLogo': awayTeamData?.logo,
        'teamName': awayTeamData?.name,
        'teamShortName': awayTeamData?.shortName,
      };
    }
  }
}
