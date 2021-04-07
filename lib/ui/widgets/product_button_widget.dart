import 'package:flutter/material.dart';

class ProductButtonWidget extends StatelessWidget {
  String text;

  ProductButtonWidget({this.text});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 60.0,
      width: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 20.0,
            )
          ]),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
