import 'package:bez_viz_calculator/model/constants.dart';
import 'package:bez_viz_calculator/screens/home/components/visits_list.dart';
import 'package:flutter/material.dart';
import 'summary_card.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: glDefaultPadding / 4),
          SummaryCard(),
          SizedBox(height: glDefaultPadding / 4),
          VisitsList(),
        ],
      ),
    );
  }
}
