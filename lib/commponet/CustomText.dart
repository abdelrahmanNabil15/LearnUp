// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class customText extends StatelessWidget {
  final String text;
  final double fontSize;

  final Color color;
  final Alignment alignment;
  final int maxline;
  final FontWeight fontWeight;

  const customText({
    Key? key,
    this.text = '',
    this.fontSize = 16,
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
    required this.maxline,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:  alignment ,
      child: Text(

        text,


        maxLines: maxline,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight:fontWeight,
        ),
      ),
    );
  }
}