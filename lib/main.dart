import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matchop_1/pages/screens.dart';
// import 'package:matchop/screens/home/home-screen.dart';
// import 'constants.dart';
import 'pages/screens.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaTchop',
      theme: ThemeData(
        textTheme:
            GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(), // premier controller par defaut
        'ForgotPassword': (context) => ForgotPassword(), 
        'CreateNewAccount': (context) => CreateNewAccount(),
        'Home': (context) => Home(),
      },
    );
  }
}

