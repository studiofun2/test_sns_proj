import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:test_sns_proj/view/Register.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('test sns proj - Sign In'),
              actions: const [SignOutButton()],
            ),
            body: Center(
                child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                      },
                      child: Text('Register'),
                    )),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: 400,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        email = value;
                        return null;
                      }
                      return 'please input password';
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.manage_accounts_outlined),
                        hintText: 'input your e-email',
                        labelText: 'user e-mail'),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.all(10),
                    width: 400,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          password = value;
                          return null;
                        }
                        return 'please input password';
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.key_outlined),
                          hintText: 'input your password',
                          labelText: 'password'),
                    )),
                Container(
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email, password: password);
                      },
                      child: Text('login'),
                    )),
              ],
            ))));
  }
}
