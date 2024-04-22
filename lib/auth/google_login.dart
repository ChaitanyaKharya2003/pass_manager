import 'package:flutter/material.dart';

class GoogleLogin extends StatefulWidget {
  const GoogleLogin({super.key});

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login with Google'),
      ),
      body: Center(
        child: Column(
          children: const <Widget>[
            Text('Welcome to Password Manager'),
            CircularProgressIndicator(),
          ],
        ),
      )
    );
  }
}