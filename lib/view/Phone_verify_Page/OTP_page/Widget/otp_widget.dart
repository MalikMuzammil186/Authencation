import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fir_base_auth_demo2/bloc/phone_bloc/phone_bloc.dart';
import 'package:flutter_fir_base_auth_demo2/bloc/phone_bloc/phone_event.dart';

// ignore: must_be_immutable
class OTPWidgetPAge extends StatelessWidget {
  String verificationId;
   OTPWidgetPAge({super.key,required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          TextField(
            controller:context.read<PhoneBloc>().smsController,
            decoration: const InputDecoration(
              hintText: 'Enter Your OTP',
                helperText: "OTP MUst be IN Number", border: OutlineInputBorder()),
          ),

          ElevatedButton(
              onPressed: (){
                context.read<PhoneBloc>().add(OTPEvent(verificationId:verificationId));
               
              },
              child: const Text("Verify OTP"))
        ],
      );
  }
}