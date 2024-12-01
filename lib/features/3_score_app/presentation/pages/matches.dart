import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_project/core/assets/color_assets.dart';
import 'package:interview_project/features/3_score_app/presentation/bloc/match_data_bloc/match_data_bloc.dart';
import 'package:interview_project/features/3_score_app/presentation/pages/build_match.dart';
import 'package:interview_project/features/3_score_app/presentation/widgets/build_match_container_header.dart';
import 'package:interview_project/features/3_score_app/presentation/widgets/matches_sliver_header.dart';
import '../../../../core/notifier/counter_notifier.dart';
import '../../../../core/utils/screen_utils.dart';
import '../../../../core/utils/texts_utils.dart';

class MatchesPage extends StatefulWidget {
  final bool isPage;

  const MatchesPage({super.key, this.isPage = true});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);

    final bloc = BlocProvider.of<MatchDataBloc>(context);
    if (bloc.state is! MatchDataLoaded) {
      bloc.add(FetchMatchData());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: notifier,
      builder: (context, child) {
        return CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: MatchesSliverHeader(
                  tabController: tabController, isPage: widget.isPage),
            ),
            _buildTabBarView(),
          ],
        );
      },
    );
  }

  Widget _buildTabBarView() {
    final height = MediaQuery.of(context).size.height;

    return SliverFillRemaining(
      child: TabBarView(
        controller: tabController,
        children: [
          const Placeholder(),
          const Placeholder(),
          ListView.builder(
            padding: const EdgeInsets.only(top: 20),
            itemCount: 1,
            itemBuilder: (context, index) {
              return BlocConsumer<MatchDataBloc, MatchDataState>(
                listener: (context, state) {
                  if (state is MatchDataError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: ${state.message}')),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is MatchDataLoading || state is MatchDataInitial) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is MatchDataLoaded) {
                    final match = state.match.data?.event;
                    if (match == null) return Container();

                    final tournament = match.tournament?.name ?? "";
                    final parts = tournament.split(', ');
                    final tournamentName = parts[0];
                    final stage = parts.length > 1 ? parts[1] : "";
                    final homeTeam = match.homeTeam!;
                    final awayTeam = match.awayTeam!;

                    return Card(
                      clipBehavior: Clip.hardEdge,
                      elevation: 10,
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      shadowColor: ColorAssets.kBlack.withOpacity(0.3),
                      color: ColorAssets.kScaffoldBgCOlor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SizedBox(
                        height: height * 0.14,
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return Column(
                              children: [
                                BuildMatchContainerHeader(
                                  constraints: constraints,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            if (state.logo.data != null &&
                                                state.logo.data!.isNotEmpty)
                                              Image.memory(
                                                base64Decode(state.logo.data!),
                                                height: 24,
                                              ),
                                            const SizedBox(
                                              width: Spacing.x2,
                                            ),
                                            Flexible(
                                              child: Text(
                                                tournamentName,
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    TextUtils.kMediumTextstyle(
                                                            color:
                                                                ColorAssets.kST)
                                                        .copyWith(
                                                            letterSpacing: 0.1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          stage,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.end,
                                          style: TextUtils.kMediumTextstyle(
                                                  color: ColorAssets.kST)
                                              .copyWith(letterSpacing: 0.1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                BuildMatch(
                                  homeTeam: homeTeam,
                                  awayTeam: awayTeam,
                                  isPage: widget.isPage,
                                  state: state,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    );
                  } else if (state is MatchDataError) {
                    return Center(child: Text('Error: ${state.message}'));
                  } else {
                    return Container(
                      height: 50,
                      color: Colors.red,
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
