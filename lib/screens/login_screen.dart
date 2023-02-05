import 'package:flutter/material.dart';
import 'package:shoppingapp/utils/routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = "";
  String password = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(milliseconds: 1000));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/cat.png',
              fit: BoxFit.cover,
              height: 200,
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter Username',
                        labelText: 'Username',
                      ),
                      onChanged: (value) => {
                        username = value,
                        setState(() {}),
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Username cannot be empty';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Enter password',
                        labelText: 'Password',
                      ),
                      onChanged: (value) => {
                        password = value,
                        setState(() {}),
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password cannot be empty';
                        } else if (value.length < 6) {
                          return 'Password length should be atleast 6';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      splashColor: Colors.red,
                      onTap: () => moveToHome(context),
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
                                'Login',
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
                        Navigator.pushNamed(context, MyRoutes.registerRoute);
                      },
                      child: const Text(
                        'New User? Register',
                        style: TextStyle(
                          color: Color.fromARGB(255, 113, 106, 248),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
