// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  double width;
  Function function;
  String text;
  bool isUpper;
  Color color;

  DefaultButton({
    Key? key,
    required this.function,
    this.width = double.infinity,
    required this.text,
    this.isUpper = true,
    this.color = Colors.cyan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 40.0,
      child: MaterialButton(
        color: color,
        onPressed: () {
          function();
        },
        child: Text(
          isUpper ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}