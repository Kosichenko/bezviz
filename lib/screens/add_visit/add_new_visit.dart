import 'package:bez_viz_calculator/model/constants.dart';
import 'package:flutter/material.dart';

class AddNewVisit extends StatelessWidget {
// to-do remove unused class
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: glPrimaryColor.withOpacity(0.5),
              offset: (Offset(0, 10)),
              blurRadius: 50,
            )
          ],
          color: glPrimaryColorDark,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          children: <Widget>[

            Row(
              children: [
                Text('Заезд в ЕС'),

              ],
            ),
            Row(
              children: [
                Text('Выезд из ЕС'),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
