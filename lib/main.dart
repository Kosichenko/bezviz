import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

import 'model/constants.dart';
import 'screens/home_screen.dart';

void main() => runApp(BezVizApp());


class BezVizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'BezViz 90/180',
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
