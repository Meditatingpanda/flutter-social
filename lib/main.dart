import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppingapp/screens/home_screen.dart';
import 'package:shoppingapp/screens/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        theme: ThemeData(
          primarySwatch: Colors.cyan,
         
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        routes: {
          "/": (context) => const Login(),
          "/home": (context) => const Home(),
          "/login": (context) => const Login(),
        });
  }
}
