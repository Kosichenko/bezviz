import 'package:flutter/foundation.dart';

import 'constants.dart';

class Visit {
  int id;
  DateTime startDate;
  DateTime endDate;
  int daysInPeriod;
  String title;

  Visit({
    int id,
    @required this.startDate,
    @required this.endDate,
    this.title,
  }) {
    if (startDate.compareTo(endDate) > 0) {
      DateTime _tmp = this.startDate;
      this.startDate = this.endDate;
      this.endDate = _tmp;
    }
    if (this.endDate == globalMaxDate) {
      this.daysInPeriod = DateTime.now().difference(startDate).inDays + 1;
    } else {
      this.daysInPeriod = endDate.difference(startDate).inDays + 1;
    }
    if (id == null) {
      this.id = DateTime.now().millisecondsSinceEpoch;
    }
  }

  factory Visit.fromJson(Map<String, dynamic> json) {
    return Visit(
        id: json['id'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        title: json['title']);
  }
  
  Map<String, dynamic> toJson() => {
        'id': id != null ? id : 'unknown',
        'startDate': startDate,
        'endDate': endDate,
        'title': title,
        'daysInPeriod': daysInPeriod,
      };
}
