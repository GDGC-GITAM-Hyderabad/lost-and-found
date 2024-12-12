import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../pages/Dashboard.dart';
import '../pages/auth/LoginScreen.dart';

//Authentication service - google sign-in, organisation specific login and sign-out
class AuthService{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> loginWithGoogle() async {
    try{
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await  googleUser?.authentication;

      final credentials = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,accessToken: googleAuth?.accessToken
      );

  /*
      // verifying if its valid GITAM organisation email
      final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credentials);

      final String email = userCredential.user?.email ?? '';


      if (!(email.endsWith('@gitam.in') || email.endsWith('@gitam.edu') || email.endsWith('@student.gitam.edu'))) {

        await _firebaseAuth.signOut();
         print("Not an organization mail");

        return null;
      }

 */

      return await _firebaseAuth.signInWithCredential(credentials);


    }catch(e){
      if (kDebugMode) {
        print(e);
      }
    }
    return null;

  }

  //verify whether signed-in email is organisation email.
  Future<void> signInWithOrganisation(BuildContext context) async {
    final userCredential = await loginWithGoogle();
    final String email = userCredential?.user?.email ?? '';

    if (email.endsWith('@gitam.in') || email.endsWith('@gitam.edu') || email.endsWith('@student.gitam.edu')) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Dashboard()),
      );
    }else{
      await signOut(context);
      if (kDebugMode) {
        print("Not an organization mail");
      }
    }
  }


  //signOut and navigate to Login screen
  Future<void> signOut(BuildContext context) async {

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()),);

    await GoogleSignIn().signOut();
    await _firebaseAuth.signOut();
  }
    
}