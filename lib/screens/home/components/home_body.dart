import 'package:bez_viz_calculator/bloc/visit_bloc.dart';
import 'package:bez_viz_calculator/bloc/visit_state.dart';
import 'package:bez_viz_calculator/model/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_body_bottom.dart';
import 'summary_card.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VisitBloc, VisitState>(
      builder: (context, state) {
        return Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: glDefaultPadding / 4),
              SummaryCard(),
              SizedBox(height: glDefaultPadding / 4),
              HomeBodyBottom(),
            ],
          ),
        );
      },
    );
  }
}


