import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../pages/Dashboard.dart';

//Authentication service - google login and register methods
class AuthService{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> loginWithGoogle() async {
    try{
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await  googleUser?.authentication;

      final credentials = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,accessToken: googleAuth?.accessToken
      );

      return await _firebaseAuth.signInWithCredential(credentials);


    }catch(e){
      if (kDebugMode) {
        print(e);
      }
    }
    return null;

  }

  //Navigate screen from login to dashboard
  Future<void> signInGoogle(BuildContext context) async {
    final userCredential = await loginWithGoogle();
    if (userCredential != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Dashboard()),
      );
    }
  }


  //signOut method
  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await _firebaseAuth.signOut();
  }
    
}