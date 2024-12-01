import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interview_project/core/assets/color_assets.dart';
import 'package:interview_project/core/assets/image_assets.dart';

class MatchStat extends StatelessWidget {
  final bool left,
      regular,
      checkPoint,
      endPoint,
      isPenaltyPair,
      penaltyCompleted;
  final Widget? time, details, leftPenalty, rightPenalty;

  const MatchStat({
    super.key,
    this.left = true,
    this.regular = false,
    this.endPoint = false,
    this.checkPoint = false,
    this.isPenaltyPair = false,
    this.penaltyCompleted = false,
    this.time,
    this.details,
    this.leftPenalty,
    this.rightPenalty,
  });

  @override
  Widget build(BuildContext context) {
    if (isPenaltyPair) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return _buildPenaltyPairContent(context, constraints.maxWidth);
        },
      );
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return _buildRegularContent(context, constraints.maxWidth);
      },
    );
  }

  Widget _buildPenaltyPairContent(BuildContext context, double maxWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (endPoint)
              SvgPicture.asset(
                ImageAssets.end,
                colorFilter: const ColorFilter.mode(
                  ColorAssets.kDarkGrey,
                  BlendMode.srcIn,
                ),
              ),
            _buildDashedLine(),
            _buildPenaltyStack(context, maxWidth),
          ],
        ),
      ],
    );
  }

  Widget _buildRegularContent(BuildContext context, double maxWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (endPoint)
              SvgPicture.asset(
                ImageAssets.end,
                colorFilter: const ColorFilter.mode(
                  ColorAssets.kDarkGrey,
                  BlendMode.srcIn,
                ),
              ),
            _buildDashedLine(),
            _buildRegularStack(context, maxWidth),
          ],
        ),
      ],
    );
  }

  Widget _buildDashedLine() {
    return CustomPaint(
      size: const Size(5.0, 60.0),
      painter: DashedLinePainter(
        color: ColorAssets.klightGreen,
      ),
    );
  }

  Widget _buildPenaltyStack(BuildContext context, double maxWidth) {
    return SizedBox(
      width: maxWidth,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            child: SizedBox(
              width: maxWidth * 0.46,
              child: leftPenalty,
            ),
          ),
          Positioned(
            right: 0,
            child: SizedBox(
              width: maxWidth * 0.46,
              child: rightPenalty,
            ),
          ),
          _buildPenaltyTimeContainer(),
        ],
      ),
    );
  }

  Widget _buildRegularStack(BuildContext context, double maxWidth) {
    return SizedBox(
      width: maxWidth,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          if (!checkPoint && regular)
            Positioned(
              left: left ? 0 : null,
              right: !left ? 0 : null,
              child: SizedBox(
                width: maxWidth * 0.46,
                child: details,
              ),
            ),
          _buildRegularTimeContainer(),
        ],
      ),
    );
  }

  Widget _buildPenaltyTimeContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color:
            penaltyCompleted ? ColorAssets.kLightGrey : ColorAssets.klightGreen,
      ),
      child: time,
    );
  }

  Widget _buildRegularTimeContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: checkPoint ? ColorAssets.kLightGrey : ColorAssets.klightGreen,
      ),
      child: time,
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final Color color;

  DashedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    double totalDashCount = 8;
    double dashHeight = size.height / totalDashCount;

    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 2;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(Offset(size.width / 2, startY),
          Offset(size.width / 2, startY + dashHeight / 2), paint);
      startY += dashHeight;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
