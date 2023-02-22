import 'package:flutter/material.dart';
import 'package:matchop/components/app-bar.dart';
import 'package:matchop/components/body.dart';
import 'package:matchop/components/bottom-nav-bar.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      bottomNavigationBar: BottomNavBar(),
      body: Body(),
    );
  }
}
