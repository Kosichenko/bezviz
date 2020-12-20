import 'package:bez_viz_calculator/bloc/visit_bloc.dart';
import 'package:bez_viz_calculator/bloc/visit_state.dart';
import 'package:bez_viz_calculator/screens/home/components/visit_add_item_form.dart';
import 'package:bez_viz_calculator/screens/home/components/visits_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBodyBottom extends StatelessWidget {
  const HomeBodyBottom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = BlocProvider.of<VisitBloc>(context).state;
    if (state is StateAddNewVisit) {
      return VisitAddItemForm();
    }
    return VisitsList();
  }
}
