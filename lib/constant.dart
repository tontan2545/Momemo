import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:intl/intl.dart';

const kHeaderTextStyle = TextStyle(
  fontSize: 28,
  color: Colors.white,
  fontWeight: FontWeight.w500,
);

const kInListTileTextTheme = TextStyle(
  fontSize: 24,
  color: Color(0xFF525252),
);

const kInTextFieldTextStyle = TextStyle(
  fontSize: 16,
  color: Color(0xFF525252),
);

const kInTextFieldPrefixTextStyle = TextStyle(
  fontSize: 16,
  color: Color(0xFF707070),
);

Color ciPercentageColor(double percentage) {
  if (percentage >= 0.75) return kGreen;
  if (percentage >= 0.5) return kLightGreen;
  if (percentage >= 0.25) return kLightRed;
  return kRed;
}

Color ciPercentageBarColor(double percentage) {
  if (percentage >= 0.75) return kRed;
  if (percentage >= 0.5) return kLightRed;
  if (percentage >= 0.25) return kLightGreen;
  return kGreen;
}

const Color kBlackButtonColor = Color(0x99525252);
const Color kBlackFontColor = Color(0xFF525252);
const Color kBackgroundColor = Color(0xFFEBE5E1);
const Color kGreen = Color(0xFF5F9595);
const Color kLightGreen = Color(0xFFA6D9C9);
const Color kRed = Color(0xFFE86F50);
const Color kLightRed = Color(0xFFFEBDA4);
const Color kLightBlue = Color(0xFF93B6C9);
const Color kInteractiveCICardColor = Color(0xCCFFFFFF);
const double kRoundedCorner = 25;
const double kTextFieldBorderRadius = 12;

//Animations
const kCIAnimationType = DialogTransitionType.scale;
const Curve kCICurve = Curves.linearToEaseOut;
const Duration kCIDuration = Duration(milliseconds: 500);
