import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton(this.textBottom, this.icons, this.page);
  final String textBottom;
  final IconData icons;
  final Function page;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 7),
            child: IconButton(
              onPressed: page(),
              icon: Icon(
                icons,
                size: 45,
                color: Colors.red,
              ),
            ),
            height: kBottomContainerHeight,
            color: kBottomContainerColor,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              textBottom,
              style: kBottomTextStyle,
            ),
          ),
        ]),
      ],
    );
  }
}
// Row(children: <Widget>[
//                 Expanded(child: BottomButton("Home", Icons.home, () {})),
//                 Expanded(
//                     child:
//                         BottomButton("Cart", Icons.add_shopping_cart, () {})),
//                 Expanded(
//                     child: BottomButton("Account", Icons.account_box, () {})),
//                 Expanded(child: BottomButton("Menu", Icons.menu, () {})),
//               ])