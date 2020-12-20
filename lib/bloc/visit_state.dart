import 'package:bez_viz_calculator/model/visit.dart';
import 'package:flutter/material.dart';

abstract class VisitState {}

class StateVisitsEmpty extends VisitState {}

class StateAddNewVisit extends VisitState {}

class StateVisitsLoading extends VisitState {}

class StateVisitsSave extends VisitState {
  List<dynamic> loadedVisits;
  StateVisitsSave({@required this.loadedVisits}) : assert(loadedVisits != null);
}

class StateVisitDelete extends VisitState {
  int id;
  StateVisitDelete({@required this.id});
  //: assert(loadedVisits != null && id > 0 );
}

class StateVisitEdit extends VisitState {
  //List<dynamic> loadedVisits;
  int id;
  StateVisitEdit({@required this.id});
  //: assert(loadedVisits != null && id > 0 );
}

class StateVisitInitial extends VisitState {}

class StateVisitsLoaded extends VisitState {
  final List<Visit> visits = List<Visit>();
  final totalDaysInEU;
  StateVisitsLoaded(List<Visit> _visits, {this.totalDaysInEU}) {
    assert(_visits != null);
    visits.addAll(_visits);
  }
}

class StateVisitError extends VisitState {}
