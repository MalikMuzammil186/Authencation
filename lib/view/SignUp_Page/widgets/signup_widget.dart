import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fir_base_auth_demo2/bloc/Sign_in_bloc/auth_bloc.dart';
import 'package:flutter_fir_base_auth_demo2/bloc/Sign_in_bloc/auth_bloc_event.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});
  

  @override
  Widget build(BuildContext context) {
    final Size(:width,:height)=MediaQuery.sizeOf(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("SIGN UP PAGE"),
          SizedBox(width: width*0.8,
          height: height*0.05,
            child: TextFormField(
              controller: context.read<AuthBloc>().emailController,
              decoration:const InputDecoration(
                hintText: ' Enter e mail',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20),),borderSide: BorderSide(color: Colors.yellowAccent)),
                focusedBorder: OutlineInputBorder(borderSide:
                BorderSide(color: Colors.blueGrey,style: BorderStyle.solid,strokeAlign: BorderSide.strokeAlignInside)),
                ))
              ),
            
          
          
             SizedBox(
              width: width*0.8,
              height: height*0.05,
              child: TextFormField(
                controller:  context.read<AuthBloc>().passwordController,
                decoration:const  InputDecoration(
                  hintText: 'Enter Your Password',
                   border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20),),borderSide: BorderSide(color: Colors.cyanAccent)),
                  focusedBorder: OutlineInputBorder(borderSide:
                  BorderSide(color: Colors.blueGrey,style: BorderStyle.solid,strokeAlign: BorderSide.strokeAlignInside)),
                ),
              ),
            ),
          
          ElevatedButton(onPressed:(){
          context.read<AuthBloc>().add(AuthInitialEvent());
          }, child:const  Text("GET STARTED"))
        ],
      ),
    );
  }
}