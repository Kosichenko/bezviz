import 'package:flutter/material.dart';

import 'model/constants.dart';
import 'screens/home_screen.dart';

void main() => runApp(BezVizApp());


class BezVizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BezViz Calculator',
      theme: ThemeData(
        scaffoldBackgroundColor: glPrimaryBackgroundColor,
        primaryColor: glPrimaryColorDark,
        textTheme:
            Theme.of(context).textTheme.apply(bodyColor: glIconTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(color: glPrimaryColorDark),
      ),
      home: HomeScreen(),
    );
  }
}
