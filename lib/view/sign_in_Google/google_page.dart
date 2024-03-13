

import 'package:flutter/material.dart';
import 'package:flutter_fir_base_auth_demo2/auth/service.dart';

// ignore: must_be_immutable
class GoogleSignInPage extends StatelessWidget {
  GoogleSignInPage({super.key});

  static const String name="/googleSigninPage";


    AuthenticationServices authServices=AuthenticationServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("G o o g l e S i g n I n P a g e"),centerTitle: true,),
      body: Center(child: 
      SizedBox(width: 300,height: 150,
        child: ElevatedButton(style:const ButtonStyle(backgroundColor:  MaterialStatePropertyAll(Colors.greenAccent)
         )
        ,onPressed: ()async{
          await authServices.signInWithGoogle();
        
        }, child:const  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
           Text("Sign In With Google"),Icon(Icons.login)
        ],)),
      ),),
    );
  }
}