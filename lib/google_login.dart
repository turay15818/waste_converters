import 'package:flutter/material.dart';

class GoogleSignUp extends StatefulWidget {
  GoogleSignUp({Key? key}) : super(key: key);

  @override
  State<GoogleSignUp> createState() => _GoogleSignUpState();
}

class _GoogleSignUpState extends State<GoogleSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:  Center(child: Text('hello world')),
    );
  }
}