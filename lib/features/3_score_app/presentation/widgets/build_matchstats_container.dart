import 'package:flutter/material.dart';
import 'package:interview_project/core/assets/color_assets.dart';
import 'package:interview_project/core/utils/screen_utils.dart';
import 'package:interview_project/core/utils/texts_utils.dart';
import 'package:interview_project/features/3_score_app/presentation/widgets/build_match_container_header.dart';

class BuildMatchstatsContainer extends StatelessWidget {
  const BuildMatchstatsContainer({
    super.key,
    required this.incidentWidgets,
  });

  final List<Widget> incidentWidgets;

  @override
  Widget build(BuildContext context) {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 12,
                  ),
                  Text(
                    "Match Current Stat",
                    style: TextUtils.kMediumTextstyle(color: ColorAssets.kST),
                  ),
                  const CircleAvatar(
                    radius: 12,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Spacing.x3,
            ),
            ...incidentWidgets,
            const SizedBox(
              height: Spacing.x5,
            )
          ],
        ),
      ),
    );
  }
}
