import 'package:bez_viz_calculator/bloc/visit_bloc.dart';
import 'package:bez_viz_calculator/bloc/visit_event.dart';
import 'package:bez_viz_calculator/model/constants.dart';
import 'package:bez_viz_calculator/services/visit_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_visit/add_new_visit.dart';
import 'home/components/home_body.dart';

class HomeScreen extends StatelessWidget {
  final VisitsRepository visitsRepository = VisitsRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VisitBloc>(
      create: (context) => VisitBloc(visitsRepository: visitsRepository)
        ..add(EventLoadAllVisits()),
      child: BlocBuilder<VisitBloc, dynamic>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Center(
                  child: Text(
                'Калькулятор безвиза 90/180',
                style: TextStyle(
                  color: glIconTextColor,
                ),
              )),
            ),
            body: HomeBody(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniEndDocked,
            floatingActionButton: FloatingActionButton(
              backgroundColor: glPrimaryColorDark,
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNewVisit(),
                  ),
                ),
              },
              tooltip: 'Добавить поездку',
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
