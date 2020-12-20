import 'package:bez_viz_calculator/bloc/visit_bloc.dart';
import 'package:bez_viz_calculator/bloc/visit_event.dart';
import 'package:bez_viz_calculator/model/constants.dart';
import 'package:bez_viz_calculator/services/visit_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/components/home_body.dart';

class HomeScreen extends StatelessWidget {
  final VisitsRepository visitsRepository = VisitsRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VisitBloc>(
      create: (context) => VisitBloc(visitsRepository: visitsRepository)..add(EventLoadAllVisits()),
      child: Scaffold(
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: glPrimaryColorDark,
         // onPressed: () => BlocProvider.of<VisitBloc>(context).add(EventAddVisit()),
          onPressed: () => VisitBloc(visitsRepository: visitsRepository).add(EventAddVisit()),
          //{
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => AddNewVisit(),
            //   ),
            // );
          //},
          tooltip: 'Добавить выезд',
          child: Icon(Icons.add),
        ),
         floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      ),
    );
  }

  // AppBar buildAppBar() {
  //   return AppBar(
  //     elevation: 0.0,
  //     leading: IconButton(
  //       icon: SvgPicture.asset("assets/icons/menu.svg"),
  //       onPressed: () {},
  //     ),
  //   );
  // }
}
