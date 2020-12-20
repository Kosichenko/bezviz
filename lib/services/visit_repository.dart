import 'package:bez_viz_calculator/model/visit.dart';
import 'package:bez_viz_calculator/services/visit_provider.dart';

class VisitsRepository {
  List<Visit> visitsList;

  VisitProvider _visitProvider = VisitProvider();

  // Future<List<Visit>> getAllVisits async () { 
  //   visitsList = _visitProvider.loadVisits();
  // return Future(visitsList);
  // };

  Future<List<Visit>> getAllVisits() async {
    if(visitsList == null) {
      visitsList = await _visitProvider.loadVisits();
    }
  return Future.value(visitsList);
  }

  Future<void> deleteVisitById(int id) async {
    visitsList.removeWhere((visit) => visit.id == id);
  }

  Future saveAllVisits() async => _visitProvider.writeJson(); 
}