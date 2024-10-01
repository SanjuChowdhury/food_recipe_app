import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class MyAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return Container(
        width: width * .20,
        padding: EdgeInsets.only(right: 15),
        child: Center(
          child: GFAvatar(
            radius: 30,
          ),
        ));
  }
}
