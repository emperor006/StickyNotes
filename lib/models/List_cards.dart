import 'dart:math';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import '../Utilities/TitleTexts.dart';
import '../models/textcolor_model.dart';

class ListCards extends StatelessWidget {
  //const ListCards({ Key? key }) : super(key: key);
  String title, body;
  DateTime dateTime;
  TextColorModel colorModel;
  ListCards(this.body, this.dateTime, this.title, this.colorModel);

  List<Color> randomColor = [
    Colors.green,
    Colors.blue,
    Colors.deepOrange,
    Colors.amber,
    Colors.white70,
    Colors.lime,
    Colors.teal,
    Colors.cyan,
    Colors.indigo,
    Colors.red
  ];

  List<TextColorModel> colorlist = [];
  //int numb=Random().nextInt(colorlist.length);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 19,
      child: Container(
        padding: const EdgeInsets.all(10),
        color: colorModel.background,
        child: Column(
          children: [
            SizedBox(
              height: 20,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 17,
                  color: colorModel.textColor,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              body,
              style: TextStyle(color: colorModel.textColor),
            ),
            const SizedBox(
              height: 8,
            ),
            FittedBox(
                child: Text(
              DateFormat.yMMM().format(dateTime),
              style:  TextStyle(
                color:colorModel.textColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
