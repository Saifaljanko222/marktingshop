import 'package:flutter/material.dart';

class DataContent extends StatelessWidget {
  DataContent(this.picture);
  final AssetImage picture;
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Image(
          image: picture,
          height: 150,
          width: double.infinity,
          fit: BoxFit.cover),
      Row(
        children: <Widget>[
          Text("Price"),
          SizedBox(
            width: 60,
          ),
          Text("quantity"),
        ],
      ),
    ]);
  }
}
