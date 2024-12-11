import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lost_and_found/pages/Dashboard.dart';
import 'package:lost_and_found/pages/auth/LoginScreen.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: FirebaseAuth.instance.authStateChanges().first,builder: (context, snapshot){
      if(snapshot.connectionState == ConnectionState.waiting){
        return const Center(child: CircularProgressIndicator());
      }else if(snapshot.hasData){
        return const Dashboard();
      }else{
        return const LoginScreen();
      }

    }
    );
  }

}