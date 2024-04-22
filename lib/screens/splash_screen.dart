import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pass_manager/utils/colors.dart';
import 'package:pass_manager/utils/sizes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/login',
          (route) => false,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/home',
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kblue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to Password Manager',
                  style: TextStyle(
                      fontSize: getHeight(context, 3), color: kWhite)),
              SizedBox(
                height: getHeight(context, 2),
              ),
              const CircularProgressIndicator(
                color: kWhite,
              ),
            ],
          ),
        ));
  }
}
