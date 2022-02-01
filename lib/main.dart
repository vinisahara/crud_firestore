import 'package:crud_firestore/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:crud_firestore/home_page.dart';
import 'package:crud_firestore/splashscreen_view.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routes = <String, WidgetBuilder>{
      Login.tag: (context) => Login(),
      HomePage.tag: (context) => HomePage(),
    };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Splash Screen",
      home: SplashScreenPage(),
      routes: routes,
    );
  }
}
