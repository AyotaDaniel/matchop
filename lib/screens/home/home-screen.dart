import 'package:flutter/material.dart';
import 'package:matchop_1/components/app-bar.dart';
import 'package:matchop_1/components/bottom-nav-bar.dart';
import 'package:matchop_1/components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      bottomNavigationBar: BottomNavBar(),
      body: Body(),
    );
  }
}
