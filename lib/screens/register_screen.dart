import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/components/show_snackbar.dart';
import 'package:shoppingapp/providers/register_provider.dart';
import 'package:shoppingapp/screens/login_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterProvider>(
      create: (context) => RegisterProvider(),
      child: Consumer<RegisterProvider>(
        builder: (context, value, child) {
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
                  const Text(
                      "Let your Imposter Syndrome come out from your brain"),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter Username',
                            labelText: 'Username',
                          ),
                          controller: value.username,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter Email',
                            labelText: 'Email',
                          ),
                          controller: value.email,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Enter password',
                            labelText: 'Password',
                          ),
                          controller: value.password,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Re-Enter password',
                            labelText: 'Confirm Password',
                          ),
                          controller: value.confirmpassword,
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
                            value.register(value.username.text,
                                value.email.text, value.password.text, context);
                            await Future.delayed(
                                const Duration(milliseconds: 1000));
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
        },
      ),
    );
  }
}
