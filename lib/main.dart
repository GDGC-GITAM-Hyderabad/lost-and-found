import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lost_and_found/pages/SplashScreen.dart';
import 'package:lost_and_found/ui/CustomTheme.dart';

import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const SplashScreen(),
    );
  }
}
