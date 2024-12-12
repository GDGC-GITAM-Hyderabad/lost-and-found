import 'package:flutter/material.dart';
import 'package:lost_and_found/services/AuthService.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginScreen extends StatelessWidget{

  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Lost & Found", style: TextStyle(fontSize: 24)),
              const SizedBox(height: 42),
              SignInButton(Buttons.google, onPressed: ()async{
                await AuthService().signInWithOrganisation(context);
              })
            ],
          )
        ),
      ),
    );
  }

}