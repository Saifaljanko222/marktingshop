import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(this.color, this.cardChild);
  final Color color;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(5),
      height: 215,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
    );
  }
}
