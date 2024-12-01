import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interview_project/core/assets/color_assets.dart';

abstract class TextUtils {
  static TextStyle kSmallTextstyle({Color? color}) {
    return GoogleFonts.outfit(
      fontWeight: FontWeight.w500,
      fontSize: 11,
      height: 1.45,
      letterSpacing: 0.5,
      color: color ?? ColorAssets.kUT,
    );
  }

  static TextStyle kBoldSmallTextstyle({Color? color}) {
    return GoogleFonts.outfit(
      fontWeight: FontWeight.w700,
      fontSize: 11,
      height: 1.45,
      letterSpacing: 0.5,
      color: color ?? ColorAssets.kUT,
    );
  }

  static TextStyle klightSmallTextstyle({Color? color}) {
    return GoogleFonts.outfit(
      fontWeight: FontWeight.w400,
      fontSize: 11,
      height: 1.45,
      letterSpacing: 0.5,
      color: color ?? ColorAssets.kUT,
    );
  }

  static TextStyle kSubtitleTextstyle({Color? color}) {
    return GoogleFonts.outfit(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 1.14,
      letterSpacing: 0.5,
      color: color ?? ColorAssets.kUT,
    );
  }

  static TextStyle kMediumTextstyle({Color? color}) {
    return GoogleFonts.outfit(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 1.14,
      letterSpacing: 0.5,
      color: color ?? ColorAssets.kUT,
    );
  }

  static TextStyle kSemiLargeTextstyle({Color? color}) {
    return GoogleFonts.outfit(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 1.5,
      letterSpacing: 0.5,
      color: color ?? ColorAssets.kUT,
    );
  }

  static TextStyle kLargeTextstyle({Color? color}) {
    return GoogleFonts.outfit(
      fontWeight: FontWeight.w700,
      fontSize: 22,
      height: 1.27,
      letterSpacing: 0.5,
      color: color ?? ColorAssets.kUT,
    );
  }
}
