import 'package:flutter/cupertino.dart';
import 'package:movies_app/screens/Auth/login_screen.dart';
import 'package:movies_app/screens/Auth/register_screen.dart';

class AuthPage extends StatefulWidget {

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage=true;
  void toggleScreen(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override

  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginScreen(showRegisterPage: toggleScreen);
    }else{
      return RegisterPage(showLoginPage: toggleScreen);
    }
  }
}
