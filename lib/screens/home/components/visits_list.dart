import 'package:bez_viz_calculator/bloc/visit_bloc.dart';
import 'package:bez_viz_calculator/bloc/visit_event.dart';
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
          itemBuilder: (context, index) {
            var visit = state.visits[index];
            return Dismissible(
              key: Key(visit.id.toString()),
              confirmDismiss: (direction) => _getConfirm(context),
              onDismissed: (direction) {
                BlocProvider.of<VisitBloc>(context)
                    .add(EventDeleteVisit(id: visit.id));
              },
              direction: DismissDirection.startToEnd,
              child: VisitItem(
                visit: state.visits[index],
              ),
            );
          },
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

  Future<bool> _getConfirm(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
            'Удалить поездку?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              backgroundColor: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text("Да"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text("Нет"),
            ),
          ],
        );
      },
    );
  }
}
