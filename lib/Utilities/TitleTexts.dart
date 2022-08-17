import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  // const TitleText({ Key? key }) : super(key: key);
  String title;
  TitleText(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(title, style:const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold
    ),);
  }
}
