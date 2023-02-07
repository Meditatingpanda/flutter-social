import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shoppingapp/api/api.dart';
import 'package:shoppingapp/components/show_snackbar.dart';
import 'package:shoppingapp/screens/login_screen.dart';

class RegisterProvider with ChangeNotifier {
  final TextEditingController email = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();
  bool changeButton = false;

  void setChangeButton(bool changeButton) {
    this.changeButton = changeButton;
    notifyListeners();
  }

  register(String email, username, pass, context) async {
    Map data = {
      'email': email,
      'username': username,
      'password': pass,
    };
    // print(data);

    String body = json.encode(data);
    var url = Uri.parse('${Api.BASE_URL}/auth/register');
    var response = await http.post(
      url,
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "https://confesso-2.web.app"
      },
    );
    // print(response.body);
    // print(response.statusCode);
    if (response.statusCode == 200) {
      //Or put here your next screen using Navigator.push() method
      showSnackBar(context, 'Registration Successful', false);
      await Future.delayed(const Duration(milliseconds: 2000));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Login()));
    } else {
      showSnackBar(context, 'Registration Failed', true);
      // print('error');
    }
  }
}
