import 'package:flutter/material.dart';
import 'package:matchop_1/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matchop_1/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar:AppBar(
      backgroundColor: Colors.yellow,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
           Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(FontAwesomeIcons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.plus),
            onPressed: () {},
        ),
      ],
    ),
      body: Body(),
    );
  }
}
