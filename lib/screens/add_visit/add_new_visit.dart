import 'dart:math';

import 'package:bez_viz_calculator/bloc/visit_bloc.dart';
import 'package:bez_viz_calculator/bloc/visit_event.dart';
import 'package:bez_viz_calculator/model/constants.dart';
import 'package:bez_viz_calculator/model/visit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validators/validators.dart';
import 'package:intl/intl.dart';

class AddNewVisit extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: (Offset(0, 10)),
              blurRadius: 10,
            )
          ],
          color: glPrimaryColor,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        margin: EdgeInsets.symmetric(
           vertical: size.height  * .10,
           horizontal: size.width * .05,
        ),
       height: size.height * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Дата въезда'),
            RaisedButton(
              child: Text('Pick a date'),
              onPressed: () {showDatePicker(context: context, firstDate: globalMinDate, lastDate: globalMaxDate, initialDate:  DateTime.now(), );},
            ),
            TextFormField(
              validator: (value) {
                if (!isDate(value)) {
                  return 'Не правильная дата';
                }
                return null;
              },
            ),
            Text('Дата выезда'),
            // VisitDetails(visit: visit),
            SaveButton(),
            // VisitDays(days: visit.daysInPeriod),
          ],
        ),
      ),
    );
  }
}

class VisitDays extends StatelessWidget {
  final int days;
  const VisitDays({Key key, this.days}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
            left: glDefaultPadding / 2,
            right: glDefaultPadding / 2,
            bottom: glDefaultPadding / 2,
          ),
          height: glDefaultPadding * 1.5,
          width: glDefaultPadding * 1.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Text(
            days.toString(),
            style: TextStyle(
              fontSize: glDefaultPadding / 1.5,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              backgroundColor: Colors.white,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}

class VisitDetails extends StatelessWidget {
  final Visit visit;
  const VisitDetails({
    Key key,
    this.visit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedStartDate =
        DateFormat('dd-MM-yyyy').format(visit.startDate);
    String formattedEndDate;
    if (visit.endDate == globalMaxDate) {
      formattedEndDate = '....................';
    } else {
      formattedEndDate = DateFormat('dd-MM-yyyy').format(visit.endDate);
    }
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      width: 150,
      child: Column(children: <Widget>[
        Text(visit.title.substring(0, min(visit.title.length, 15)),
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
        Text(formattedStartDate, textAlign: TextAlign.left),
        Text(formattedEndDate, textAlign: TextAlign.left),
      ]),
    );
  }
}

class CancelButton extends StatelessWidget {
  const CancelButton({
    Key key,
    @required this.id,
  }) : super(key: key);

  final id;

  @override
  Widget build(BuildContext context) {
    // var state = BlocProvider.of<VisitBloc>(context).state;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: glDefaultPadding / 2),
      child: MaterialButton(
        elevation: 5,
        height: 55.0,
        minWidth: 40.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: glPrimaryColor,
        textColor: glIconTextColor,
        child: Icon(
          Icons.clear,
          color: glIconTextColor,
        ),
        onPressed: () =>
            //context.read<VisitBloc>().add(EventDeleteVisit(id: id)),
            BlocProvider.of<VisitBloc>(context).add(EventDeleteVisit(id: id)),
        splashColor: Colors.redAccent,
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: glDefaultPadding / 2),
      child: MaterialButton(
        elevation: 5,
        height: 55.0,
        minWidth: 40.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: glPrimaryColor,
        textColor: glIconTextColor,
        child: Icon(
          Icons.save,
          color: glIconTextColor,
        ),
        onPressed: () => {},
        splashColor: glAccentColor,
      ),
    );
  }
}
