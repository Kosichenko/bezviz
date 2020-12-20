import 'package:bez_viz_calculator/bloc/visit_bloc.dart';
import 'package:bez_viz_calculator/model/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:bez_viz_calculator/bloc/visit_state.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = BlocProvider.of<VisitBloc>(context).state;
    if (state is StateVisitsLoaded && state.visits != null) {
      int totalDaysInEU = state.totalDaysInEU;
      return Container(
        height: 150,
        margin: EdgeInsets.symmetric(horizontal: glDefaultPadding / 5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black, 
              offset: (Offset(0, 10)),
              blurRadius: 10,
            )
          ],
          color: glPrimaryColorDark,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          children: [
            UpperRow(),
            Indicator(
              visitedDays: totalDaysInEU,
            ),
            BottomRow(
              daysInEU: totalDaysInEU,
            ),
          ],
        ),
      );
    }
    return Spacer();
  }
}

class Indicator extends StatelessWidget {
  final int visitedDays;

  const Indicator({
    Key key,
    this.visitedDays,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int procent = ((100 * visitedDays) ~/ maxDaysInEU);
    if (procent >= 100) {
      return Padding(
        padding: const EdgeInsets.all(glDefaultPadding / 2),
        child: LinearPercentIndicator(
          lineHeight: glDefaultPadding,
          percent: 1,
          backgroundColor: Colors.grey,
          progressColor: Colors.redAccent,
          center: Text('$procent% ($visitedDays/$maxDaysInEU)'),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(glDefaultPadding / 2),
      child: LinearPercentIndicator(
        lineHeight: glDefaultPadding,
        percent: visitedDays / maxDaysInEU,
        backgroundColor: Colors.grey,
        progressColor: Colors.blue,
        center: Text('$procent% ($visitedDays/$maxDaysInEU)'),
      ),
    );
  }
}

class BottomRow extends StatelessWidget {
  final int daysInEU;

  const BottomRow({
    Key key,
    this.daysInEU,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int daysInUA = constPeriodDays - daysInEU;
    if (daysInUA < 0) daysInUA = 0;

    int daysRemains = maxDaysInEU - daysInEU;
    if (daysRemains < 0) daysRemains = 0;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Spacer(),
        Container(
          margin: EdgeInsets.only(
            left: glDefaultPadding,
            right: glDefaultPadding,
            bottom: glDefaultPadding / 2,
          ),
          height: glDefaultPadding * 2.5,
          width: glDefaultPadding * 2.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: glPrimaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(glDefaultPadding * 5),
            ),
          ),
          child: Text(
            "$daysInUA",
            style: TextStyle(
              fontSize: glDefaultPadding,
              //fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontFamily: 'Georgia',
              color: glIconTextColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Spacer(),
        Container(
          alignment: Alignment.bottomCenter,
          height: glDefaultPadding * 2.5,
          width: glDefaultPadding * 7,
          decoration: BoxDecoration(
            color: glPrimaryColor, //glAccentColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Text(
            "Ост $daysRemains дней",
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: glIconTextColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          padding: EdgeInsets.all(glDefaultPadding / 2),
        ),
        Spacer(),
        Container(
          margin: EdgeInsets.only(
            left: glDefaultPadding,
            right: glDefaultPadding,
            bottom: glDefaultPadding / 2,
          ),
          height: glDefaultPadding * 2.5,
          width: glDefaultPadding * 2.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(glDefaultPadding * 5),
            ),
            color: glPrimaryColor,
          ),
          child: Text(
            "$daysInEU",
            style: TextStyle(
              fontSize: glDefaultPadding,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Spacer(),
      ],
    );
  }
}

class UpperRow extends StatelessWidget {
  const UpperRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Spacer(),
        UkrFlag(),
        Spacer(),
        Container(
          height: glDefaultPadding * 2.5,
          width: glDefaultPadding * 7,
          decoration: BoxDecoration(
            color: glPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Text(
            "180 дней",
            style: Theme.of(context).textTheme.headline5.copyWith(
                  color: glIconTextColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          padding: EdgeInsets.all(glDefaultPadding / 2),
        ),
        Spacer(),
        EUFlag(),
        Spacer(),
      ],
    );
  }
}

class EUFlag extends StatelessWidget {
  const EUFlag({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: glDefaultPadding / 2),
      child: SvgPicture.asset(
        "assets/images/flag_eu.svg",
        width: glDefaultPadding * 3,
        height: glDefaultPadding * 2,
        fit: BoxFit.cover,
      ),
    );
  }
}

class UkrFlag extends StatelessWidget {
  const UkrFlag({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: glDefaultPadding / 2),
      child: SvgPicture.asset(
        "assets/images/flag_ukr.svg",
        width: glDefaultPadding * 3,
        height: glDefaultPadding * 2,
        fit: BoxFit.cover,
      ),
    );
  }
}
