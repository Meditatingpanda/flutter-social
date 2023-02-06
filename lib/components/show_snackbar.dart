import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message,bool error) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: error ? Colors.red : Colors.green,
    content: Center(
      child: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    ),
  ));
}
