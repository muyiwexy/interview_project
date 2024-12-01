import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_project/core/assets/color_assets.dart';
import 'package:interview_project/features/3_score_app/presentation/pages/home.dart';
import 'package:interview_project/features/3_score_app/presentation/pages/match_details.dart';

import '../../../../core/notifier/counter_notifier.dart';
import '../../../../core/utils/navigation.dart';
import '../../../../core/utils/screen_utils.dart';
import '../bloc/match_data_bloc/match_data_bloc.dart';
import 'matches.dart';

class RootLayout extends StatefulWidget {
  const RootLayout({
    super.key,
  });

  @override
  State<RootLayout> createState() => _RootLayoutState();
}

class _RootLayoutState extends State<RootLayout> {
  @override
  void initState() {
    super.initState();

    final bloc = BlocProvider.of<MatchDataBloc>(context);
    if (bloc.state is! MatchDataLoaded) {
      bloc.add(FetchMatchData());
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenUtils.getScreenSize(context);
    final orientation = MediaQuery.orientationOf(context);
    final layoutInfo = (screenSize, orientation);
    var isBigDevice = ScreenUtils.isBigDevice(screenSize);
    if (isBigDevice) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      });
    }
    return Scaffold(
      backgroundColor: ColorAssets.kScaffoldBgCOlor,
      bottomNavigationBar: switch (layoutInfo) {
        (ScreenSize.normal || ScreenSize.small, Orientation.portrait) =>
          const CounterNavigationBar(),
        (_) => null,
      },
      drawer: const Drawer(),
      body: switch (layoutInfo) {
        (ScreenSize.large || ScreenSize.extraLarge, _) => Row(
            children: [
              const CounterNavigationRail(),
              const VerticalDivider(thickness: 1, width: 1),
              Expanded(
                child: NavigationLayout(
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: MatchesPage(isPage: false),
                      ),
                      Expanded(child: Container())
                      // Expanded(
                      //   child: BlocConsumer<MatchDataBloc, MatchDataState>(
                      //     listener: (context, state) {
                      //       if (state is MatchDataError) {
                      //         ScaffoldMessenger.of(context).showSnackBar(
                      //           SnackBar(
                      //               content: Text('Error: ${state.message}')),
                      //         );
                      //       }
                      //     },
                      //     builder: (context, state) {
                      //       if (state is MatchDataLoading ||
                      //           state is MatchDataInitial) {
                      //         return const Center(
                      //             child: CircularProgressIndicator());
                      //       } else if (state is MatchDataLoaded) {
                      //         return MatchDetails(
                      //             matchLoadedState: state, isPage: false);
                      //       } else if (state is MatchDataError) {
                      //         return Center(
                      //             child: Text('Error: ${state.message}'));
                      //       } else {
                      //         return Container();
                      //       }
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        (_, Orientation.landscape) => const Row(
            children: [
              CounterNavigationRail(),
              VerticalDivider(thickness: 1, width: 1),
              Expanded(
                child: NavigationLayout(
                  child: MatchesPage(isPage: true),
                ),
              )
            ],
          ),
        _ => const NavigationLayout(child: MatchesPage(isPage: true)),
      },
    );
  }
}

class NavigationLayout extends StatelessWidget {
  final Widget child;
  const NavigationLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: notifier,
        builder: (context, _) {
          return IndexedStack(
              index: notifier.selectedNavigationIndex,
              children: [
                const Home(),
                child,
              ]);
        });
  }
}
