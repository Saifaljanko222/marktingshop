import 'package:flutter/material.dart';

class textfieldwidget extends StatelessWidget {
  textfieldwidget(
      {required this.text, required this.Icont, required this.controller});

  final String text;
  final IconData Icont;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: Icon(Icont),
          label: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(65, 58, 251, 0.779),
            ),
          )),
    );
  }
}
