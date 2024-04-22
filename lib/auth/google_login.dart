import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pass_manager/repository/auth_repository.dart';

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
        title: const Center(child:  Text('Login with Google')),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                AuthRepository().signInWithGoogle();
                if(FirebaseAuth.instance.currentUser != null) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    "/home",
                    (route) => false,
                  );
                }
              },
              child: const Text('Login with Google'),
            ),
          ],
        ),
      )
    );
  }
}