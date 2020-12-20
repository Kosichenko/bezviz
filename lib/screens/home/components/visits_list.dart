import 'package:bez_viz_calculator/bloc/visit_bloc.dart';
import 'package:bez_viz_calculator/bloc/visit_state.dart';
import 'package:bez_viz_calculator/model/visit.dart';
import 'package:bez_viz_calculator/screens/home/components/visit_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VisitsList extends StatelessWidget {
  final List<Visit> visits;
  const VisitsList({
    this.visits,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = BlocProvider.of<VisitBloc>(context).state;
    if (state is StateVisitsEmpty) {
      return Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (state is StateVisitsLoaded && state.visits != null) {
      return Expanded(
        child: ListView.builder(
          itemCount: state.visits.length,
          itemBuilder: (context, index) => VisitItem(
            visit: state.visits[index],
          ),
        ),
      );
    }

    return Text('Unknow state');
    // final VisitBloc visitBloc = BlocProvider.of<VisitBloc>(context);
    // if (visits == null || visits.isEmpty) {
    //    return CircularProgressIndicator();
    // } else {
    //   return Expanded(
    //     child: ListView.builder(
    //       itemCount: 5,
    //       itemBuilder: (context, index) => VisitItem(
    //         visit: visits[index],
    //       ),
    //     ),
    //     // ),
    //   );
    // }
  }
}
