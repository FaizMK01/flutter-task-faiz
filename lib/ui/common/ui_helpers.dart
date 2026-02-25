import 'dart:math';
import 'package:flutter/material.dart';

// ─── Base Sizes ───────────────────────────────────────────────────────────────
const double _tinySize = 5.0;
const double _smallSize = 10.0;
const double _mediumSize = 25.0;
const double _largeSize = 50.0;
const double _massiveSize = 120.0;

// ─── Horizontal Spaces ────────────────────────────────────────────────────────
const Widget horizontalSpaceTiny = SizedBox(width: _tinySize);
const Widget horizontalSpaceSmall = SizedBox(width: _smallSize);
const Widget horizontalSpaceMedium = SizedBox(width: _mediumSize);
const Widget horizontalSpaceLarge = SizedBox(width: _largeSize);

// ─── Vertical Spaces ──────────────────────────────────────────────────────────
const Widget verticalSpaceTiny = SizedBox(height: _tinySize);       // 5px
const Widget verticalSpaceSmall = SizedBox(height: _smallSize);     // 10px
const Widget verticalSpaceMedium = SizedBox(height: _mediumSize);   // 25px
const Widget verticalSpaceLarge = SizedBox(height: _largeSize);     // 50px
const Widget verticalSpaceMassive = SizedBox(height: _massiveSize); // 120px

// ─── App Specific Vertical Spaces ─────────────────────────────────────────────
const Widget verticalSpace2 = SizedBox(height: 2);
const Widget verticalSpace4 = SizedBox(height: 4);
const Widget verticalSpace8 = SizedBox(height: 8);
const Widget verticalSpace10 = SizedBox(height: 8);

const Widget verticalSpace12 = SizedBox(height: 12);
const Widget verticalSpace16 = SizedBox(height: 16);
const Widget verticalSpace17 = SizedBox(height: 17);
const Widget verticalSpace24 = SizedBox(height: 24);
const Widget verticalSpace32 = SizedBox(height: 32);

// ─── App Specific Horizontal Spaces ───────────────────────────────────────────
const Widget horizontalSpace4 = SizedBox(width: 4);
const Widget horizontalSpace8 = SizedBox(width: 8);
const Widget horizontalSpace14 = SizedBox(width: 14);

// ─── Dynamic Space ────────────────────────────────────────────────────────────
Widget verticalSpace(double height) => SizedBox(height: height);
Widget horizontalSpace(double width) => SizedBox(width: width);

// ─── Screen Dimensions ────────────────────────────────────────────────────────
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

// ─── Screen Fractions ─────────────────────────────────────────────────────────
double screenHeightFraction(
  BuildContext context, {
  int dividedBy = 1,
  double offsetBy = 0,
  double max = 3000,
}) =>
    min((screenHeight(context) - offsetBy) / dividedBy, max);

double screenWidthFraction(
  BuildContext context, {
  int dividedBy = 1,
  double offsetBy = 0,
  double max = 3000,
}) =>
    min((screenWidth(context) - offsetBy) / dividedBy, max);

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);

double quarterScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 4);

// ─── App Specific Width Helpers ───────────────────────────────────────────────
/// Search bar width: 390 - 47 = 343px
double searchBarWidth(BuildContext context) =>
    screenWidth(context) - 47;

/// BundleCard width: one third of screen minus padding
double bundleCardWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3, offsetBy: 24);

/// EuroConnectCard width: half screen minus padding
double euroCardWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2, offsetBy: 46);

// ─── App Specific Height Helpers ──────────────────────────────────────────────
/// CartSheet height based on item count
double cartSheetHeight(int itemCount) =>
    itemCount == 1 ? 190 : itemCount == 2 ? 260 : 280;

// ─── Responsive Font Sizes ────────────────────────────────────────────────────
double getResponsiveHorizontalSpaceMedium(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 10);

double getResponsiveSmallFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 14, max: 15);

double getResponsiveMediumFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 16, max: 17);

double getResponsiveLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 21, max: 31);

double getResponsiveExtraLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 25);

double getResponsiveMassiveFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 30);

double getResponsiveFontSize(
  BuildContext context, {
  double? fontSize,
  double? max,
}) {
  max ??= 100;
  return min(
    screenWidthFraction(context, dividedBy: 10) * ((fontSize ?? 100) / 100),
    max,
  );
}