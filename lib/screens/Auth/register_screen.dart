import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../modules/theme/my_theme.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  RegisterPage({required this.showLoginPage});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmpasswordController = TextEditingController();
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
                        Text("Sign up",
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
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                            controller: confirmpasswordController,
                            obscureText: true,
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                            decoration: const InputDecoration(
                                hintText: "Confirm password",
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
                  onPressed: () => signUp(),
                  child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text(
                        "Sign up",
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
                    Text("Already a member ? ",style: GoogleFonts.poppins(textStyle: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(
                        color: Colors.grey))),
                    GestureDetector(
                      onTap: () => widget.showLoginPage(),
                      child: Text(" Signup now",style: GoogleFonts.poppins(textStyle: Theme.of(context)
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
  Future signUp() async{
    if(passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()
      );
    }

}
bool passwordConfirmed(){
    if(passwordController.text.trim()== confirmpasswordController.text.trim()){
      return true;
    }else{
      return false;
    }
}
}
