
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fir_base_auth_demo2/bloc/phone_bloc/phone_bloc.dart';
import 'package:flutter_fir_base_auth_demo2/bloc/phone_bloc/phone_state.dart';
import 'package:flutter_fir_base_auth_demo2/view/Phone_verify_Page/OTP_page/Widget/otp_widget.dart';
import 'package:flutter_fir_base_auth_demo2/view/widgets/loading.dart';


// ignore: must_be_immutable
class OtpPage extends StatelessWidget {
//String verificationId;
   OtpPage({super.key});
  static const String name="/otpPage";


  @override
  Widget build(BuildContext context) {
   String verificationId= ModalRoute.of(context)!.settings.arguments as String;
    return BlocListener<PhoneBloc,PhoneState>(listener: (context, state) {
      if (state is LoadedOTPPhoneState) {
         ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(state.sucessMsg)));
      }else if (state is ErorrPhoneState) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.erorrmsg,)));
      }
      
    },
      child: Scaffold(
        appBar: AppBar(),
        body:Center(child: BlocBuilder(bloc: context.read<PhoneBloc>(),
        builder:(context, state) {
          if (state is LoadingOTPstate) {
            return const LoadingWidget();
          }else{
            return OTPWidgetPAge(verificationId: verificationId);
          }
          
        },))
      ),
    );
  }
}
