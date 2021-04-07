import 'package:flutter/material.dart';

class ErrorWidgetq extends StatelessWidget {
  String message;

  ErrorWidgetq({this.message});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message, style: TextStyle(color: Colors.white),));
  }
}
