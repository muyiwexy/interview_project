import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_project/core/assets/color_assets.dart';
import 'package:interview_project/features/3_score_app/presentation/bloc/incident_bloc/incident_bloc.dart';
import 'package:interview_project/features/3_score_app/presentation/bloc/match_data_bloc/match_data_bloc.dart';
import 'package:interview_project/features/3_score_app/presentation/widgets/match_details_over_view.dart';
import 'package:interview_project/features/3_score_app/presentation/widgets/matches_details_sliver_header.dart';
import '../../../../core/notifier/counter_notifier.dart';
import '../../../../core/utils/screen_utils.dart';

class MatchDetails extends StatefulWidget {
  final bool isPage;
  const MatchDetails(
      {super.key, required this.matchLoadedState, required this.isPage});

  final MatchDataLoaded matchLoadedState;

  @override
  State<MatchDetails> createState() => _MatchDetailsState();
}

class _MatchDetailsState extends State<MatchDetails>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    BlocProvider.of<IncidentBloc>(context).add(FetchIncidentData());
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenUtils.getScreenSize(context);
    final orientation = MediaQuery.orientationOf(context);
    final layoutInfo = (screenSize, orientation);

    return Scaffold(
      backgroundColor: ColorAssets.kScaffoldBgCOlor,
      body: AnimatedBuilder(
        animation: notifier,
        builder: (context, child) {
          return BlocBuilder<IncidentBloc, IncidentState>(
            builder: (context, state) {
              if (state is IncidentLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is IncidentDataLoaded) {
                return CustomScrollView(
                  slivers: [
                    _buildSliverHeader(layoutInfo, state),
                    _buildTabBarView(),
                  ],
                );
              } else if (state is IncidentError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: Text('Press button to fetch data'));
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildSliverHeader(
      (ScreenSize, Orientation) layoutInfo, IncidentDataLoaded state) {
    switch (layoutInfo) {
      case (ScreenSize.normal || ScreenSize.small, Orientation.portrait):
        return SliverPersistentHeader(
          delegate: MatchesDetailsSliverHeader(
            tabController: tabController,
            state: state,
            matchLoadedState: widget.matchLoadedState,
          ),
        );
      default:
        return const SliverToBoxAdapter();
    }
  }

  Widget _buildTabBarView() {
    return SliverFillRemaining(
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          MatchDetailsOverView(matchLoadedState: widget.matchLoadedState),
          const Placeholder(),
          const Placeholder(),
          const Placeholder(),
        ],
      ),
    );
  }
}
