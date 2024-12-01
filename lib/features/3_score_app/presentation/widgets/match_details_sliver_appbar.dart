import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interview_project/core/assets/color_assets.dart';
import 'package:interview_project/core/assets/image_assets.dart';
import 'package:interview_project/core/utils/texts_utils.dart';
import 'package:interview_project/features/3_score_app/presentation/bloc/incident_bloc/incident_bloc.dart';
import 'package:interview_project/features/3_score_app/presentation/bloc/match_data_bloc/match_data_bloc.dart';

class MatchDetailsSliverAppBar extends StatelessWidget {
  const MatchDetailsSliverAppBar({
    super.key,
    required this.width,
    required this.maxExtent,
    required this.state,
    required this.matchLoadedState,
  });

  final double width;
  final double maxExtent;
  final IncidentDataLoaded state;
  final MatchDataLoaded matchLoadedState;

  @override
  Widget build(BuildContext context) {
    double titleSpacing = -30;
    return AppBar(
      toolbarHeight: kToolbarHeight,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Center(
          child: SvgPicture.asset(
            ImageAssets.chevronLeft,
            height: 24,
            width: 24,
          ),
        ),
      ),
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: Text(
        "Match Details",
        style: TextUtils.kLargeTextstyle(color: ColorAssets.kST),
      ),
      titleSpacing: titleSpacing,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: SvgPicture.asset(
            ImageAssets.notification,
          ),
        )
      ],
    );
  }
}
