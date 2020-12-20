import 'package:bez_viz_calculator/model/visit.dart';
import 'package:bez_viz_calculator/model/configuration_data.dart';
import 'package:flutter/material.dart';

import 'model/constants.dart';
import 'screens/home_screen.dart';

void main() => runApp(BezVizApp());

void setTestData(ConfigurationData cfg) {
  cfg.calculationDate =
      DateTime(2020, 06, 28); // период 180 начинается 01/01/2020
  // DateTime.now();

  cfg.visitsList.add(
    // до 01/01/2020 период не учитывается
    Visit(
      startDate: DateTime(2019, 5, 1),
      endDate: DateTime(2019, 5, 15),
    ),
  );

  cfg.visitsList.add(
    // с 01/12/2019 по 10/01/2020 = 10 дней, при старте отсчета 180 01/01/2020
    Visit(
      startDate: DateTime(2019, 12, 01),
      endDate: DateTime(2020, 01, 10),
    ),
  );

  cfg.visitsList.add(
    // с 01/01/2020 по 10/01/2020 = 10 дней
    Visit(
      startDate: DateTime(2020, 1, 1),
      endDate: DateTime(2020, 1, 10),
    ),
  );

  cfg.visitsList.add(
    // с 01/04/2020 по 10/04/2020 = 10 дней <= простой случай
    Visit(
      startDate: DateTime(2020, 4, 1),
      endDate: DateTime(2020, 4, 10),
    ),
  );

  cfg.visitsList.add(
    // с 19/06/2020 по __/__/___ = 10 дней
    Visit(
      startDate: DateTime(2020, 6, 19),
      endDate: globalMaxDate,
    ),
  );
}

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
