import 'package:flutter/material.dart';
import 'package:shoppingapp/screens/login_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String username = "";
  String password = "";
  String email = "";
  String confirmpassword = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/register.svg',
              fit: BoxFit.cover,
              height: 120,
            ),

            // Image.asset(
            //   'assets/images/register.svg',
            //   fit: BoxFit.cover,
            // ),
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
                    onChanged: (value) => {
                      username = value,
                      setState(() {}),
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter Email',
                      labelText: 'Email',
                    ),
                    onChanged: (value) => {
                      email = value,
                      setState(() {}),
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
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Re-Enter password',
                      labelText: 'Confirm Password',
                    ),
                    onChanged: (value) => {
                      confirmpassword = value,
                      setState(() {}),
                    },
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
                      print({
                        'username': username,
                        'email': email,
                        'password': password,
                        'confirmpassword': confirmpassword,
                      });
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
                  )
                ],
              ),
            ),
          ],
        ));
    ;
  }
}
