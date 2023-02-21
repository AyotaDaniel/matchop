import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:matchop/constants.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.yellow,
    elevation: 0,
    leading: Icon(
      Icons.menu,
      size: 40, //Icon Size
      color: Colors.white,
    ),
    title: RichText(
      
      text: TextSpan(
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: "MATCHOP",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(
          FontAwesomeIcons.bell
        ),
        onPressed: () {},
      ),
    ],
  );
}
