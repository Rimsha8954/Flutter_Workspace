import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:veggie_vault/Pages/login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCHMpp5e8dv1yi7ij-FT6KHt8Op4x63RFs',
        appId: '1:212332963858:android:e54769dee3d9304d5490cb',
        messagingSenderId: '212332963858',
        projectId: 'veggie-vault',
        storageBucket: 'veggie-vault.appspot.com',
      )
  )
  : await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

