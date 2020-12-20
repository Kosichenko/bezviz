import 'dart:async';

import 'package:bez_viz_calculator/bloc/visit_state.dart';
import 'package:bez_viz_calculator/bloc/visit_event.dart';
import 'package:bez_viz_calculator/model/constants.dart';
import 'package:bez_viz_calculator/model/visit.dart';
import 'package:bez_viz_calculator/services/visit_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VisitBloc extends Bloc<VisitEvent, VisitState> {
  final VisitsRepository visitsRepository;

  VisitBloc({this.visitsRepository}) : super(StateVisitsEmpty()) {
    assert(visitsRepository != null);
  }

  @override
  Stream<VisitState> mapEventToState(VisitEvent event) async* {
    List<Visit> _loadedVistList = List<Visit>();
    if (event is EventLoadAllVisits) {
      yield StateVisitsLoading();
      try {
        _loadedVistList = await visitsRepository.getAllVisits();
        int totalDaysInEU =
            calcDaysInUEForLast180(DateTime.now(), _loadedVistList);
        yield StateVisitsLoaded(_loadedVistList, totalDaysInEU: totalDaysInEU);
      } catch (_) {
        yield StateVisitError();
      }
    } else if (event is EventDeleteVisit) {
      visitsRepository.deleteVisitById(event.id);
      _loadedVistList = await visitsRepository.getAllVisits();
      int totalDaysInEU =
          calcDaysInUEForLast180(DateTime.now(), _loadedVistList);
      yield StateVisitsLoaded(_loadedVistList, totalDaysInEU: totalDaysInEU);
    } else if (event is EventSaveVisits) {
      visitsRepository.saveAllVisits();
      try {
        final List<Visit> _loadedVistList =
            await visitsRepository.getAllVisits();
        int totalDaysInEU =
            calcDaysInUEForLast180(DateTime.now(), _loadedVistList);
        yield StateVisitsLoaded(_loadedVistList, totalDaysInEU: totalDaysInEU);
      } catch (_) {
        yield StateVisitError();
      }
    } else if (event is EventAddVisit) {
      yield StateAddNewVisit();
      //yield StateVisitError();
    }
  }

  int calcDaysInUEForLast180(DateTime calculationDate, List<Visit> visitsList) {
    int _days = 0;
    DateTime _start;
    DateTime _end;

    DateTime dateBefore180Days =
        calculationDate.subtract(Duration(days: constPeriodDays - 1));

    for (var visit in visitsList) {
      if (visit.endDate.compareTo(dateBefore180Days) > 0) {
        if (visit.startDate.compareTo(dateBefore180Days) < 0) {
          _start = dateBefore180Days;
        } else {
          _start = visit.startDate;
        }

        if (visit.endDate.compareTo(calculationDate) > 0) {
          _end = calculationDate;
        } else {
          _end = visit.endDate;
        }

        _days += differace(_start, _end);
      }
    }
    return _days;
  }

  int differace(DateTime _start, DateTime _end) {
    return _end.difference(_start).inDays + 1;
  }
}
