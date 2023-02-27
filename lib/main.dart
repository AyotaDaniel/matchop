import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matchop/pages/authentication.dart';
import 'package:matchop/pages/screens.dart';
// import 'package:matchop/screens/home/home-screen.dart';
// import 'constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        '/': (context) => const Authentication(), // premier controller par defaut
        'ForgotPassword': (context) => ForgotPassword(), 
        'CreateNewAccount': (context) => CreateNewAccount(),
        'Home': (context) => Home(),
      },
    );
  }
}

