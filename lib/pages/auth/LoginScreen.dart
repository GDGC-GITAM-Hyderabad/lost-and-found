import 'package:flutter/material.dart';
import 'package:lost_and_found/services/AuthService.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginScreen extends StatelessWidget{

  const LoginScreen({super.key});

  /*
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

   */

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
              const SizedBox(height: 24),
              /*
              const TextField(
                decoration: InputDecoration(
                  labelText: "username"
                ),
              ),
              const SizedBox(height: 8,),
              const TextField(
                decoration: InputDecoration(
                  labelText: "password",

                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: (){
              }, child: const Text("Login")),

               */

              const SizedBox(height: 16),


              SignInButton(Buttons.google, onPressed: ()async{
                await AuthService().signInGoogle(context);

              })
            ],
          )
        ),
      ),
    );
  }

}