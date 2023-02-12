import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/providers/home_provider.dart';
import 'package:shoppingapp/screens/followers_screen.dart';
import 'package:shoppingapp/screens/following_screen.dart';
import 'package:shoppingapp/screens/get_started_screen.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: MaterialApp(
          themeMode: ThemeMode.light,
          theme: ThemeData(
            primarySwatch: Colors.lightBlue,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          initialRoute: MyRoutes.getStartedRoute,
          routes: {
            MyRoutes.getStartedRoute: (context) => const BackgroundVideo(),
            MyRoutes.loginRoute: (context) => const Login(),
            MyRoutes.registerRoute: (context) => const Register(),
            MyRoutes.homeRoute: (context) => const Home(),
            MyRoutes.profileRoute: (context) => Profile(),
            MyRoutes.followersRoute: (context) => const Followers(),
            MyRoutes.followingsRoute: (context) => const Following(),
          }),
    );
  }
}
