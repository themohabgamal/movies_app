import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/modules/theme/my_theme.dart';

class AccountSettings extends StatelessWidget {
  static const String routeName = "accountSettings";
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "Signed in as",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.grey),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "${user?.email}",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ),
            Container(child: ElevatedButton(
              onPressed: () => signOut(),
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    "Sign out",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(fontWeight: FontWeight.bold),
                  )),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(MyTheme.yellow)),
            ),)
          ],
        ),
      ),
    );
  }
  void signOut(){
    FirebaseAuth.instance.signOut();
  }
}
