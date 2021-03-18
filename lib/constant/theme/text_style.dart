import 'dart:ui';

import 'package:flutter/material.dart';

import 'colors.dart';
import 'colors.dart';

const textTheme = const TextTheme(
    headline6: ProjectTextStyle.title,
    subtitle1: ProjectTextStyle.subtitle,
    bodyText1: ProjectTextStyle.body,
    button: ProjectTextStyle.button);

class ProjectTextStyle {
  ProjectTextStyle._();
// Text Styles
  static const TextStyle title = TextStyle(
      fontSize: 24, color: ProjectColor.textColor, fontWeight: FontWeight.w700);
  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    color: ProjectColor.textColor,
  );
  static const TextStyle body = subtitle;

  static const TextStyle button =
      TextStyle(fontSize: 14, color: ProjectColor.white);
}
