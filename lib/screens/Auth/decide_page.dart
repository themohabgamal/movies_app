import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/screens/Auth/auth_page.dart';
import 'package:movies_app/screens/Auth/login_screen.dart';
import 'package:movies_app/screens/Home/home_screen.dart';

class DecidePage extends StatelessWidget {
  static const String routeName = 'homeBody';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
