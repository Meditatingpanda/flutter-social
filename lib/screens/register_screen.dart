import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shoppingapp/components/show_snackbar.dart';
import 'package:shoppingapp/screens/login_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController email = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();
  bool changeButton = false;
  Future register(String email, username, pass, context) async {
    Map data = {
      'email': email,
      'username': username,
      'password': pass,
    };
    // print(data);

    String body = json.encode(data);
    var url = Uri.parse('http://localhost:5500/api/auth/register');
    var response = await http.post(
      url,
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/register.svg',
              fit: BoxFit.cover,
              height: 120,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Confesso",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Let your Imposter Syndrome come out from your brain"),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter Username',
                      labelText: 'Username',
                    ),
                    controller: username,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter Email',
                      labelText: 'Email',
                    ),
                    controller: email,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Enter password',
                      labelText: 'Password',
                    ),
                    controller: password,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Re-Enter password',
                      labelText: 'Confirm Password',
                    ),
                    controller: confirmpassword,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    splashColor: Colors.red,
                    onTap: () async {
                      setState(() {
                        changeButton = true;
                      });
                      register(
                          email.text, username.text, password.text, context);
                      await Future.delayed(const Duration(milliseconds: 1000));
                      //Navigator.pushNamed(context, MyRoutes.homeRoute);
                      setState(() {
                        changeButton = false;
                      });
                    },
                    child: AnimatedContainer(
                      width: changeButton ? 45 : 150,
                      height: 45,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 113, 106, 248),
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 4),
                      ),
                      duration: const Duration(milliseconds: 1000),
                      alignment: Alignment.center,
                      child: changeButton
                          ? const Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : const Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    },
                    child: const Text(
                      'Already have an account? Login',
                      style: TextStyle(
                        color: Color.fromARGB(255, 113, 106, 248),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
