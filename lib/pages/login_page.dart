import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/login_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('lib/assets/logo.png', fit: BoxFit.cover, height: 50),
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        shadowColor: Colors.transparent,
      ),
      body: Center(
        child: Login(),
      ),
    );
  }
}