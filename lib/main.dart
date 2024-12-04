import 'package:flutter/material.dart';
import 'package:lost_and_found/pages/auth/LoginScreen.dart';
import 'package:lost_and_found/ui/CustomTheme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lost & Found',
      theme: theme,
      home: const LoginScreen(),
    );
  }
}
