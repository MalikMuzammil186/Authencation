import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fir_base_auth_demo2/auth/service.dart';
import 'package:flutter_fir_base_auth_demo2/bloc/phone_bloc/phone_bloc.dart';
import 'package:flutter_fir_base_auth_demo2/bloc/phone_bloc/phone_event.dart';


class PhoneVerificationWidget extends StatefulWidget {
  const PhoneVerificationWidget({super.key});

  @override
  State<PhoneVerificationWidget> createState() => _PhoneVerificationWidgetState();
}

class _PhoneVerificationWidgetState extends State<PhoneVerificationWidget> {

  AuthenticationServices authServices=AuthenticationServices();
    
   

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
        
           controller:context.read<PhoneBloc>().phoneController,
           keyboardType: TextInputType.phone,
            decoration: const  InputDecoration(hintText: 'Enter Your Phone Number' ,
            
              border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(213, 149, 198, 15),
              style: BorderStyle.solid,strokeAlign: BorderSide.strokeAlignInside))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 90),
          child: ElevatedButton(onPressed: (){
context.read<PhoneBloc>().add(InitialPhoneEvent());          


          }, child: const Text("Verify Phone Number")),
        )
      ],
    );
  }
}