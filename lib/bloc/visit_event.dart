import 'package:flutter/material.dart';

@immutable
abstract class VisitEvent {}

class EventLoadAllVisits extends VisitEvent {}

class EventAddVisit extends VisitEvent {}

class EventDeleteVisit extends VisitEvent {
  final int id;
  EventDeleteVisit({this.id});
}

class EventEditVisit extends VisitEvent {}

class EventSaveVisits extends VisitEvent {}