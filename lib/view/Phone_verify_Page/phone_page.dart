import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fir_base_auth_demo2/bloc/phone_bloc/phone_bloc.dart';
import 'package:flutter_fir_base_auth_demo2/bloc/phone_bloc/phone_state.dart';
import 'package:flutter_fir_base_auth_demo2/view/Phone_verify_Page/Widgets/phone_widget.dart';
import 'package:flutter_fir_base_auth_demo2/view/widgets/loading.dart';

class PhonePage extends StatelessWidget {
  const PhonePage({super.key});
static const String name="/signInPage";
  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneBloc,PhoneState> (listener: (context, state) {
       if (state is LoadedPhoneState) {
         ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(state.sucessMsg)));
      }else if (state is ErorrPhoneState) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.erorrmsg,)));
      }
    },
      child: Scaffold(
        appBar: AppBar(title: const Text("SIGN IN PAGE"),centerTitle: true,),
        body:Center(child:BlocBuilder(bloc: context.read<PhoneBloc>(),
        builder:(context, state) {
          if (state is LoadingPhoneStaet) {
            return const  LoadingWidget();
          }else{
             return  const PhoneVerificationWidget();
          }
        },) ,),
      ),
    );
  }
}