import 'package:flutter/material.dart';
import 'package:shoppingapp/screens/home_screen.dart';
import 'package:shoppingapp/screens/login_screen.dart';
import 'package:shoppingapp/screens/profile_screen.dart';
import 'package:shoppingapp/screens/register_screen.dart';
import 'package:shoppingapp/utils/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        initialRoute: MyRoutes.loginRoute,
        routes: {
          MyRoutes.loginRoute: (context) => const Login(),
          MyRoutes.homeRoute: (context) => const Home(),
          MyRoutes.registerRoute: (context) => const Register(),
          MyRoutes.profileRoute: (context) => const Profile(),
        });
  }
}
