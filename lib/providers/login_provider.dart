import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shoppingapp/api/api.dart';

import 'package:shoppingapp/components/show_snackbar.dart';
import 'package:shoppingapp/screens/home_screen.dart';

class LoginProvider with ChangeNotifier {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool changeButton = false;
  bool isLoading = false;
  void setChangeButton(bool changeButton) {
    this.changeButton = changeButton;
    notifyListeners();
  }

  void setIsLoading(bool isLoading) {
    this.isLoading = isLoading;
    notifyListeners();
  }

  login(String email, pass, context) async {
    setIsLoading(true);
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    Map data = {
      'email': email,
      'password': pass,
    };
    // print(data);

    String body = json.encode(data);
    var url = Uri.parse('${Api.BASE_URL}/auth/login');
    var response = await http.post(
      url,
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "https://confesso-2.web.app"
      },
    );
    setIsLoading(false);
    // print(response.body);
    // print(response.statusCode);

    if (response.statusCode == 200) {
      //Or put here your next screen using Navigator.push() method
      setChangeButton(true);
      Map user = jsonDecode(response.body);
      prefs.setString('User', jsonEncode(user));

      showSnackBar(context, 'Login Successful', false);
      await Future.delayed(const Duration(milliseconds: 1000));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home()));
      setChangeButton(false);
    } else {
      showSnackBar(context, 'Login Failed', true);
      //print('error');
    }
  }
}
