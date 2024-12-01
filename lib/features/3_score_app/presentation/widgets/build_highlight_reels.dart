import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:interview_project/core/utils/screen_utils.dart';

class BuildHighlightReels extends StatelessWidget {
  const BuildHighlightReels({super.key, required this.controllers});
  final List<YoutubePlayerController> controllers;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final screenSize = ScreenUtils.getScreenSize(context);
    final orientation = MediaQuery.orientationOf(context);
    final layoutInfo = (screenSize, orientation);

    return SizedBox(
      height: switch (layoutInfo) {
        (_, Orientation.landscape) => size.height,
        _ => size.height * 0.2,
      },
      child: ListView.separated(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final controller = controllers[index];
          return Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: YoutubePlayerBuilder(
                onExitFullScreen: () {},
                player: YoutubePlayer(
                  controller: controller,
                  showVideoProgressIndicator: true,
                  onReady: () {
                    controller.addListener(() {});
                  },
                  bottomActions: const [
                    CurrentPosition(),
                    ProgressBar(isExpanded: true),
                    FullScreenButton(),
                  ],
                ),
                builder: (context, player) {
                  return player;
                },
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 0,
          );
        },
        itemCount: controllers.length,
      ),
    );
  }
}
