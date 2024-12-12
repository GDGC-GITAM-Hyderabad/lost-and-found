import 'package:flutter/material.dart';
import 'package:lost_and_found/pages/auth/LoginScreen.dart';

import '../services/AuthService.dart';

class Dashboard extends StatelessWidget{
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Lost & Found"),
            const SizedBox(height: 24,),
            ElevatedButton(onPressed: ()async{
              await AuthService().signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()),);

            }, child: const Text("Sign Out"))
          ],
        ),

      ),
    );
  }

}