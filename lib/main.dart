import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_sns_proj/view/AuthGate.dart';
import 'firebase_options.dart';

/// メイン処理
///
/// 以下の処理を行う。
/// 1. Flutter の Widgetの初期化
/// 2. Firebase の初期化
/// 3. App の起動
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // firebase の初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'FlutterFire UI - Auth',
      home: AuthGate(),
    );
  }
}
