import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interview_project/core/assets/color_assets.dart';
import 'package:interview_project/core/assets/image_assets.dart';
import 'package:interview_project/core/utils/screen_utils.dart';
import 'package:interview_project/core/utils/texts_utils.dart';
import 'package:interview_project/features/3_score_app/data/model/incident.dart';
import 'package:interview_project/features/3_score_app/data/model/match_stats_models.dart';
import 'package:interview_project/features/3_score_app/data/model/momentum_model.dart';
import 'package:interview_project/features/3_score_app/presentation/bloc/incident_bloc/incident_bloc.dart';
import 'package:interview_project/features/3_score_app/presentation/bloc/match_data_bloc/match_data_bloc.dart';
import 'package:interview_project/features/3_score_app/presentation/widgets/build_highlight_reels.dart';
import 'package:interview_project/features/3_score_app/presentation/widgets/build_man_of_the_match.dart';
import 'package:interview_project/features/3_score_app/presentation/widgets/build_matchstats_container.dart';
import 'package:interview_project/features/3_score_app/presentation/widgets/build_penalty_shoot_out_option.dart';
import 'package:interview_project/features/3_score_app/presentation/widgets/match_stat.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../data/model/match.dart';
import 'build_match_container_header.dart';
import 'package:nimble_charts/flutter.dart' as charts;

class MatchDetailsOverView extends StatefulWidget {
  const MatchDetailsOverView({super.key, required this.matchLoadedState});

  final MatchDataLoaded matchLoadedState;

  @override
  State<MatchDetailsOverView> createState() => _MatchDetailsOverViewState();
}

class _MatchDetailsOverViewState extends State<MatchDetailsOverView> {
  late List<YoutubePlayerController> _controllers;
  @override
  void initState() {
    super.initState();
    var highlights = widget.matchLoadedState.highlightModel.data?.highlights;
    _controllers = List.generate(highlights?.length ?? 0, (index) {
      return YoutubePlayerController(
        initialVideoId:
            YoutubePlayer.convertUrlToId(highlights?[index].url ?? "")!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          enableCaption: true,
          isLive: false,
          forceHD: false,
          disableDragSeek: true,
        ),
      );
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IncidentBloc, IncidentState>(
      listener: (context, state) {
        if (state is IncidentError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Error: ${state.message}')));
        }
      },
      builder: (context, state) {
        if (state is IncidentInitial || state is IncidentLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is IncidentDataLoaded) {
          var incidents = state.incident.data?.incidents
                  ?.where((incident) =>
                      incident.incidentType != IncidentType.INJURY_TIME)
                  .toList() ??
              [];

          List<Incident> penaltyTextIncidents = [];
          incidents.removeWhere((incident) {
            if (incident.text?.toLowerCase() == "pen") {
              penaltyTextIncidents.add(incident);
              return true;
            }
            return false;
          });

          incidents.sort((a, b) {
            if (a.incidentType == IncidentType.PENALTY_SHOOTOUT &&
                b.incidentType != IncidentType.PENALTY_SHOOTOUT) {
              return -1;
            } else if (a.incidentType != IncidentType.PENALTY_SHOOTOUT &&
                b.incidentType == IncidentType.PENALTY_SHOOTOUT) {
              return 1;
            } else {
              return 0;
            }
          });

          if (incidents.isEmpty && penaltyTextIncidents.isEmpty) {
            return const Center(child: Text('No incidents available'));
          }
          final match = widget.matchLoadedState.match.data?.event;
          if (match == null) return Container();

          final homeTeam = match.homeTeam!;
          final awayTeam = match.awayTeam!;

          List<Widget> incidentWidgets = [];
          List<Widget> penaltyWidgets = [];
          for (var incident in incidents) {
            if (incident.incidentType == IncidentType.PENALTY_SHOOTOUT) {
              penaltyWidgets.add(
                ListTile(
                  contentPadding: const EdgeInsets.fromLTRB(5, 3, 5, 0),
                  title: Text(
                    incident.player?.shortName ?? "",
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextUtils.kMediumTextstyle(color: ColorAssets.kBlack),
                  ),
                  trailing: incident.isHome == true
                      ? SvgPicture.asset(goalType(
                          incident.incidentType, incident.incidentClass))
                      : Image.memory(
                          base64Decode(awayTeam.logo!),
                          height: 30,
                        ),
                  leading: incident.isHome == false
                      ? SvgPicture.asset(goalType(
                          incident.incidentType, incident.incidentClass))
                      : Image.memory(
                          base64Decode(homeTeam.logo!),
                          height: 30,
                        ),
                ),
              );
            } else {
              incidentWidgets.add(_buildIncidentWidget(incident));
            }
          }

          penaltyWidgets.addAll(
            penaltyTextIncidents.map(
              (incident) => Text(
                "${mapText(
                  incident.text.toString(),
                )} (${incident.homeScore} - ${incident.awayScore})",
                style: TextUtils.klightSmallTextstyle(
                        color: ColorAssets.kDarkGrey)
                    .copyWith(fontWeight: FontWeight.w400, letterSpacing: 0.5),
              ),
            ),
          );

          _addPenaltyWidgets(incidentWidgets, penaltyWidgets);

          return ListView(
            padding: EdgeInsets.only(
                top: 20,
                bottom: MediaQuery.paddingOf(context).bottom + Spacing.x5),
            children: [
              BuildHighlightReels(controllers: _controllers),
              const SizedBox(
                height: Spacing.x4,
              ),
              BuildManOfTheMatch(matchDataState: widget.matchLoadedState),
              const SizedBox(
                height: Spacing.x4,
              ),
              BuildPenaltyShootOutOption(
                  matchEvent: widget.matchLoadedState.match.data?.event,
                  incidentData: state),
              const SizedBox(
                height: Spacing.x4,
              ),
              BuildMomentumGraph(
                matchEvent: widget.matchLoadedState.match.data?.event,
                matchStat:
                    widget.matchLoadedState.matchStatsModel.data?.statistics,
                momentumData:
                    widget.matchLoadedState.momentumModel.data?.graphPoints,
              ),
              const SizedBox(
                height: Spacing.x4,
              ),
              BuildMatchstatsContainer(incidentWidgets: incidentWidgets)
            ],
          );
        } else if (state is IncidentError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return Container();
        }
      },
    );
  }

  void _addPenaltyWidgets(
      List<Widget> incidentWidgets, List<Widget> penaltyWidgets) {
    for (int i = 0, sequence = 1;
        i < penaltyWidgets.length;
        i += 2, sequence++) {
      bool isLastPair = (i + 2 >= penaltyWidgets.length);
      incidentWidgets.insert(
        0,
        MatchStat(
          isPenaltyPair: true,
          endPoint: isLastPair,
          time: isLastPair
              ? penaltyWidgets[i]
              : Text(
                  "$sequence",
                  style: TextUtils.kBoldSmallTextstyle(color: ColorAssets.kST)
                      .copyWith(
                          fontWeight: FontWeight.w700, letterSpacing: 0.5),
                ),
          rightPenalty: !isLastPair ? penaltyWidgets[i] : null,
          penaltyCompleted: isLastPair,
          leftPenalty: i + 1 < penaltyWidgets.length
              ? penaltyWidgets[i + 1]
              : Container(),
        ),
      );
    }
  }

  Widget _buildIncidentWidget(Incident incident) {
    return MatchStat(
        checkPoint: (incident.incidentType == IncidentType.PERIOD &&
                (incident.time ?? 999) <= 120) ||
            incident.text?.toLowerCase() == "pen".toLowerCase(),
        left: incident.isHome ?? false,
        details: _buildIncidentDetails(incident),
        regular: [
          IncidentType.CARD,
          IncidentType.PERIOD,
          IncidentType.PENALTY_SHOOTOUT,
          IncidentType.SUBSTITUTION,
          IncidentType.GOAL,
        ].contains(incident.incidentType),
        time: incident.incidentType == IncidentType.PERIOD
            ? Text(
                mapText(incident.text ?? ""),
                style: TextUtils.klightSmallTextstyle(
                        color: ColorAssets.kDarkGrey)
                    .copyWith(fontWeight: FontWeight.w400, letterSpacing: 0.5),
              )
            : Text(
                incident.time.toString(),
                style: TextUtils.kBoldSmallTextstyle(color: ColorAssets.kST)
                    .copyWith(fontWeight: FontWeight.w700, letterSpacing: 0.5),
              ));
  }

  Widget _buildIncidentDetails(Incident incident) {
    final match = widget.matchLoadedState.match.data?.event;
    if (match == null) return Container();

    final homeTeam = match.homeTeam!;
    final awayTeam = match.awayTeam!;
    switch (incident.incidentType) {
      case IncidentType.CARD:
        return ListTile(
          contentPadding: const EdgeInsets.fromLTRB(5, 3, 5, 0),
          title: Text(
            incident.player?.shortName ?? "",
            overflow: TextOverflow.ellipsis,
            style: TextUtils.kMediumTextstyle(color: ColorAssets.kBlack),
          ),
          subtitle: Text(
            "(${incident.reason ?? ""})",
            style: TextUtils.kSubtitleTextstyle(),
          ),
          trailing: incident.isHome == true
              ? SvgPicture.asset(cardType(incident.incidentClass))
              : Image.memory(
                  base64Decode(awayTeam.logo!),
                  height: 30,
                ),
          leading: incident.isHome == false
              ? SvgPicture.asset(cardType(incident.incidentClass))
              : Image.memory(
                  base64Decode(homeTeam.logo!),
                  height: 30,
                ),
        );
      case IncidentType.SUBSTITUTION:
        return ListTile(
          contentPadding: const EdgeInsets.fromLTRB(5, 3, 5, 0),
          trailing: Image.asset(
            ImageAssets.sub,
            height: 20,
          ),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                ImageAssets.subInArrow,
                width: 16,
                colorFilter: const ColorFilter.mode(
                    ColorAssets.kSubinColor, BlendMode.srcIn),
              ),
              Expanded(
                  child: Text(
                incident.playerIn?.shortName ?? "",
                overflow: TextOverflow.ellipsis,
                style:
                    TextUtils.kMediumTextstyle(color: ColorAssets.kSubinColor),
              )),
            ],
          ),
          subtitle: Row(
            children: [
              SvgPicture.asset(
                ImageAssets.subOutArrow,
                width: 16,
                colorFilter: const ColorFilter.mode(
                    ColorAssets.kSubOutColor, BlendMode.srcIn),
              ),
              Expanded(
                child: Text(
                  incident.playerOut?.shortName ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: TextUtils.kMediumTextstyle(
                      color: ColorAssets.kSubOutColor),
                ),
              ),
            ],
          ),
        );
      case IncidentType.GOAL:
        return ListTile(
          contentPadding: const EdgeInsets.fromLTRB(5, 3, 5, 0),
          title: Text(
            incident.player?.shortName ?? "",
            overflow: TextOverflow.ellipsis,
            style: TextUtils.kMediumTextstyle(color: ColorAssets.kBlack),
          ),
          subtitle: incident.reason != null
              ? Text(
                  "(${incident.reason})",
                  style: TextUtils.kSubtitleTextstyle(),
                )
              : null,
          trailing: incident.isHome == true
              ? SvgPicture.asset(
                  goalType(incident.incidentType, incident.incidentClass))
              : Image.memory(
                  base64Decode(awayTeam.logo!),
                  height: 30,
                ),
          leading: incident.isHome == false
              ? SvgPicture.asset(
                  goalType(incident.incidentType, incident.incidentClass))
              : Image.memory(
                  base64Decode(homeTeam.logo!),
                  height: 30,
                ),
        );
      default:
        return Container();
    }
  }

  String cardType(IncidentClass? incidentClass) {
    switch (incidentClass) {
      case IncidentClass.YELLOW:
        return ImageAssets.yellowCard;
      case IncidentClass.RED:
        return ImageAssets.redCard;
      default:
        return ImageAssets.yellowCard;
    }
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

  String mapText(String input) {
    const Map<String, String> textMappings = {
      "ht": "Half Time",
      "ft": "End of 90 Minutes",
      "et": "Extra-Time",
      "pen": "Penalties"
    };
    return textMappings[input.toLowerCase()] ?? input;
  }
}

class BuildMomentumGraph extends StatefulWidget {
  final Event? matchEvent;
  final List<GraphPoint>? momentumData;
  final List<Statistic>? matchStat;
  const BuildMomentumGraph(
      {super.key,
      required this.matchEvent,
      required this.momentumData,
      required this.matchStat});

  @override
  State<BuildMomentumGraph> createState() => _BuildMomentumGraphState();
}

class _BuildMomentumGraphState extends State<BuildMomentumGraph> {
  StatisticsItem? getBallPossessionStats(List<Statistic> matchStat) {
    if (matchStat.isEmpty) return null;

    for (Statistic stat in matchStat) {
      if (stat.period == "ALL") {
        for (Group group in stat.groups ?? []) {
          if (group.groupName == "Match overview") {
            for (StatisticsItem item in group.statisticsItems ?? []) {
              if (item.name == "Ball possession") {
                return item;
              }
            }
          }
        }
      }
    }
    return null;
  }

  List<charts.Series<GraphPoint, String>> _generateChartData() {
    return [
      charts.Series<GraphPoint, String>(
        id: 'Momentum',
        colorFn: (GraphPoint momentum, _) => (momentum.value ?? 0) >= 0
            ? charts.MaterialPalette.yellow.shadeDefault.darker
            : charts.MaterialPalette.red.shadeDefault.darker,
        domainFn: (GraphPoint momentum, _) => momentum.minute.toString(),
        measureFn: (GraphPoint momentum, _) => momentum.value,
        data: widget.momentumData ?? [],
      )
    ];
  }

  late double _maxValue;
  late double _minValue;
  @override
  void initState() {
    super.initState();
    final data = widget.momentumData ?? [];
    _maxValue = data.fold<double>(
        0,
        (prev, element) => (element.value?.toDouble() ?? 0.0) > prev
            ? element.value?.toDouble() ?? 0
            : prev);
    _minValue = data.fold<double>(
        0,
        (prev, element) => (element.value?.toDouble() ?? 0.0) < prev
            ? element.value?.toDouble() ?? 0
            : prev);
  }

  @override
  Widget build(BuildContext context) {
    final homelogoData = widget.matchEvent?.homeTeam?.logo ?? "";
    final awaylogoData = widget.matchEvent?.awayTeam?.logo ?? "";
    final getpossession = getBallPossessionStats(widget.matchStat ?? []);
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
                    "Live Match Momentum",
                    style: TextUtils.kMediumTextstyle(color: ColorAssets.kST)
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.2,
              child: Column(
                children: [
                  const SizedBox(
                    height: Spacing.x4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          getpossession?.home ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: TextUtils.kMediumTextstyle(
                                  color: ColorAssets.kBlack)
                              .copyWith(fontWeight: FontWeight.w500),
                        )),
                        Text(
                          "Ball Possesstion",
                          style: TextUtils.kSubtitleTextstyle(
                              color: ColorAssets.kDarkGrey),
                        ),
                        Expanded(
                            child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            getpossession?.away ?? "",
                            overflow: TextOverflow.ellipsis,
                            style: TextUtils.kMediumTextstyle(
                                    color: ColorAssets.kBlack)
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        )),
                      ],
                    ),
                  ),
                  PossessionBar(
                    possession: getpossession?.homeValue ?? 0.0,
                    color1: ColorAssets.kHomeTeamPossessionColor,
                    color2: ColorAssets.kawayTeamPossessionColor,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            _buildTeamLogo(homelogoData),
                            _buildTeamLogo(awaylogoData),
                          ],
                        ),
                        const SizedBox(
                          width: Spacing.x2,
                        ),
                        Expanded(
                          child: charts.BarChart(
                            _generateChartData(),
                            animate: true,
                            vertical: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            defaultRenderer: charts.BarRendererConfig(
                              groupingType:
                                  charts.BarGroupingType.groupedStacked,
                              maxBarWidthPx: 30,
                            ),
                            domainAxis: const charts.OrdinalAxisSpec(
                              renderSpec: charts.NoneRenderSpec(),
                            ),
                            primaryMeasureAxis: const charts.NumericAxisSpec(
                              renderSpec: charts.NoneRenderSpec(),
                            ),
                            behaviors: [
                              charts.RangeAnnotation([
                                charts.RangeAnnotationSegment(0, _maxValue,
                                    charts.RangeAnnotationAxisType.measure,
                                    color: charts
                                        .MaterialPalette.yellow.shadeDefault
                                        .withAlpha(0.5)),
                                charts.RangeAnnotationSegment(_minValue, 0,
                                    charts.RangeAnnotationAxisType.measure,
                                    color: charts
                                        .MaterialPalette.red.shadeDefault
                                        .withAlpha(0.4)),
                              ]),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
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

  Expanded _buildTeamLogo(String logo) {
    return Expanded(
      child: Center(
        child: Image.memory(
          base64Decode(logo),
          height: 20,
        ),
      ),
    );
  }
}

class PossessionBar extends StatelessWidget {
  final double possession;
  final Color color1;
  final Color color2;

  const PossessionBar({
    required this.possession,
    required this.color1,
    required this.color2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 4,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: (possession * 100).toInt(),
            child: Container(
              decoration: BoxDecoration(
                color: color1,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(9),
                  bottomLeft: Radius.circular(9),
                ),
              ),
            ),
          ),
          Expanded(
            flex: ((100 - possession) * 100).toInt(),
            child: Container(
              decoration: BoxDecoration(
                color: color2,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(9),
                  bottomRight: Radius.circular(9),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
