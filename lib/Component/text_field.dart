import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markting/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(this.field, this.onScure, this.titleField);

  final TextInputType field;
  final bool onScure;
  final String titleField;
  @override
  Widget build(BuildContext context) {
    return TextField(
        //محتوي الحقل
        keyboardType: field,
        //اخفاء المحتوي كرمز
        obscureText: onScure,
        //تعريف ع ماينص الحقل
        decoration: kDecorationTextField.copyWith(hintText: titleField));
  }
}
