import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();

  late String userName;
  late String nickName;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: SelectionArea(
            child: Scaffold(
                appBar: AppBar(
                  title: const Text('test sns proj - Register'),
                  actions: const [SignOutButton()],
                ),
                body: Center(
                    child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 400,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            userName = value;
                            return null;
                          }
                          return 'please input password';
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.manage_accounts_outlined),
                            hintText: 'input your user name',
                            labelText: 'user name'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 400,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            nickName = value;
                            return null;
                          }
                          return 'please input password';
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.face),
                            hintText: 'input your nick name',
                            labelText: 'nick name'),
                      ),
                    ),
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
                            prefixIcon: Icon(Icons.mail_outline),
                            hintText: 'input your e-mail',
                            labelText: 'e-mail'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 400,
                      child: TextFormField(
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            password = value;
                            return null;
                          }
                          return 'please input password';
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.key_outlined),
                            hintText: 'input your password',
                            labelText: 'password'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 400,
                      child: TextFormField(
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please input password';
                          }

                          if (value != password) {
                            return 'input different password';
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.key_outlined),
                            hintText: 'input your confirm password',
                            labelText: 'confirm password'),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              try {
                                UserCredential credential = await FirebaseAuth
                                    .instance
                                    .createUserWithEmailAndPassword(
                                        email: email, password: password);
                                await credential.user
                                    ?.updateDisplayName(userName);
                                await FirebaseFirestore.instance
                                    .collection('Users')
                                    .add({
                                  'uid': credential.user?.uid,
                                  'email': email,
                                  'name': userName,
                                  'nickName': nickName,
                                });
                                credential.user?.reload();
                                Navigator.pop(context);
                              } on FirebaseAuthException catch (error) {
                                // パスワードが弱い場合
                                if (error.code == 'weak-password') {
                                  print('パスワードが弱いです');

                                  // メールアドレスが既に使用中の場合
                                } else if (error.code ==
                                    'email-already-in-use') {
                                  print('すでに使用されているメールアドレスです');
                                }

                                // その他エラー
                                else {
                                  print('アカウント作成エラー');
                                }
                              } catch (error) {
                                print(error);
                              }
                            }
                          },
                          child: Text('Register'),
                        )),
                  ],
                )))));
  }
}
