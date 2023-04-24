import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:test_sns_proj/view/SignIn.dart';

import 'BottomNavi.dart';
import 'ChatBody.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  AuthGateState createState() => AuthGateState();
}

class AuthGateState extends State<AuthGate> {
  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SignIn();
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('TEST SNS PROJECT'),
              actions: const [SignOutButton()],
            ),
            body: const ChatBody(),
            bottomNavigationBar: BottomNavi(),
          );
        });
  }
}