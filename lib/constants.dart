import 'package:flutter/material.dart';

const kBottomContainerHeight = 60.0;
const kActiveColorCard = Color(0xffe3e7ea);
const kInactiveColorCard = Color(0xff111328);
const kBottomContainerColor = Colors.white;
const kBTNPink = Color.fromARGB(255, 241, 39, 100);
const kBTNGreen = Color.fromRGBO(155, 152, 219, 0.773);
const kAppBarGreen = Color.fromRGBO(157, 155, 212, 0.773);
const kPressedColorBotton = Color.fromARGB(255, 53, 49, 49);
const knonPressedColorBotton = Colors.black;
const kBottomTextStyle =
    TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold);

const kDecorationTextField = InputDecoration(
  // To delete borders
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
  ),
  //عند الضغط يتم تغيير لون الحدود
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  ),
  // fillColor: Colors.red,
  filled: true,
  //حجم الداخلي للحقل
  contentPadding: const EdgeInsets.all(8),
);
