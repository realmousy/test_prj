import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'theme/colors.dart';
import 'theme/text_style.dart';

final ThemeData theme = ThemeData(
  textTheme: textTheme,
  buttonTheme: const ButtonThemeData(
    buttonColor: ProjectColor.buttonColor,
    textTheme: ButtonTextTheme.normal,
  ),
);
