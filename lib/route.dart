import 'package:flutter/material.dart';
import 'package:pass_manager/auth/google_login.dart';
import 'package:pass_manager/screens/bottom_nav.dart';
import 'package:pass_manager/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  "/splash-screen": (context) => const SplashScreen(),
  "/home": (context) => const HomeBottomNav(),
  "/login" :(context) => const GoogleLogin(),
};