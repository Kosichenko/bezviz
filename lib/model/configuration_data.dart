import 'package:bez_viz_calculator/model/visit.dart';

class ConfigurationData {
  List<Visit> visitsList = [];
  DateTime calculationDate;

  ConfigurationData({this.visitsList, this.calculationDate}) {
    if(this.visitsList == null) {
      visitsList = List();
    }
  }

  Map<String, dynamic> toJson() => {
        'calculationDate': calculationDate != null ? calculationDate : DateTime.now(),
        'list': visitsList.map((visit) => visit.toJson()).toList(),
      };
  
factory ConfigurationData.fromJson(Map<String, dynamic> json) {
    List<Visit> listOfVisites = [];
    if (json['list'] != null) {
      json['list'].forEach((content) {
        Visit visit = Visit.fromJson(content);
        listOfVisites.add(visit);
      });
    } else {
      listOfVisites = null;
    }

    return ConfigurationData(
      calculationDate: json['calculationDate'],
      visitsList: listOfVisites,
    );
  }

}
