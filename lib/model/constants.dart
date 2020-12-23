import 'package:flutter/material.dart';

// https://www.materialpalette.com/light-blue/cyan
const glPrimaryColor      = Color(0xFF03A9F4);//Color(0xFF0C9869);
const glPrimaryColorLight = Color(0xFFB3E5FC);
const glPrimaryColorDark  = Color(0xFF0288D1);
const glIconTextColor     = Color(0xFFFFFFFF);//Color(0xFF0C9869);
const glSecondaryTextColor= Color(0xFF757575);//Color(0xFF0C9869);
const glAccentColor       = Color(0xFF00BCD4);
const glPrimaryTextColor       = Color(0xFF212121);
const glPrimaryBackgroundColor = Color(0xFFB3E5FC);
const glDisabledTextColor = Color(0xFFBDBDBD);

const glDefaultPadding = 20.0;
const int constPeriodDays = 180;
const int maxDaysInEU = 90;
const int maxMillisecondsSinceEpoch = 8640000000000000;
final DateTime globalMaxDate = DateTime.fromMillisecondsSinceEpoch(maxMillisecondsSinceEpoch);
final DateTime globalMinDate = DateTime.fromMillisecondsSinceEpoch(0);