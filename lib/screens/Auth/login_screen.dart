import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/modules/theme/my_theme.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback showRegisterPage;
  LoginScreen({required this.showRegisterPage});
  static const String routeName = 'login';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text("Login",
                            style: GoogleFonts.poppins(textStyle: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 30))),
                        const SizedBox(
                          height: 20,
                        ),
                        Image.asset('assets/login.png',width: 200,),
                      ],
                    )),
                const SizedBox(
                  height: 50,
                ),
               Form(
                   key: formKey,
                   child: Column(
                 children: [
                   TextFormField(
                     controller: emailController,
                     style: const TextStyle(color: Colors.white, fontSize: 16),
                     decoration: const InputDecoration(
                         hintText: "Email",
                         hintStyle: TextStyle(color: Colors.white38),
                         prefixIcon: Icon(Icons.email,color: Colors.white,),
                         fillColor: Colors.white12,
                         filled: true
                     ),
                     validator: (value) {
                       if(value==null ||value.isEmpty){
                         return "Email can't be empty";
                       }
                       return null;
                     },
                   ),
                   const SizedBox(
                     height: 15,
                   ),
                   TextField(
                       controller: passwordController,
                       obscureText: true,
                       style: const TextStyle(color: Colors.white, fontSize: 16),
                       decoration: const InputDecoration(
                           hintText: "Password",
                           hintStyle: TextStyle(color: Colors.white38),
                           prefixIcon: Icon(Icons.lock,color: Colors.white,),
                           fillColor: Colors.white12,
                           filled: true)
                   ),
                 ],
               )),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () => signIn(),
                  child: Container(
                    width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text(
                        "Sign in",
                        style: GoogleFonts.poppins(textStyle: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(fontWeight: FontWeight.w500)),
                      )),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.yellow)),
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("No account ? ",style: GoogleFonts.poppins(textStyle: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(
                    color: Colors.grey))),
                    GestureDetector(
                      onTap: () => widget.showRegisterPage(),
                      child: Text(" Register Now",style: GoogleFonts.poppins(textStyle: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(
                      color: MyTheme.yellow))),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signIn() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.of(context).pop();
    } on FirebaseException catch (e) {
      Navigator.of(context).pop();
      if(e.code=='user-not-found'){
        showEmailError();
      }
      else if (e.code=='wrong-password'){
        showPasswordError();
      }
    }
  }

  void showEmailError() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
            titlePadding: EdgeInsets.all(30),
            title: Text("Please enter a valid email",style: TextStyle(color: Colors.black),)
        );}
    );
  }

  void showPasswordError() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(title: Text("Wrong email or password",style: TextStyle(color: Colors.black),));
      }
    );
  }
}
