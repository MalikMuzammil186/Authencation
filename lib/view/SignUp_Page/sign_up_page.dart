import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fir_base_auth_demo2/bloc/Sign_in_bloc/auth_bloc.dart';
import 'package:flutter_fir_base_auth_demo2/bloc/Sign_in_bloc/auth_bloc_state.dart';
import 'package:flutter_fir_base_auth_demo2/view/SignUp_Page/widgets/signup_widget.dart';
import 'package:flutter_fir_base_auth_demo2/view/widgets/loading.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  static const String name = '/signUpPage';

  @override
  Widget build(BuildContext context) {
     //final Size(:width,:height)=MediaQuery.sizeOf(context);
    return BlocListener<AuthBloc,AuthState>(listener:(context, state) {
      if (state is AuthLoadedState) {
         ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(state.successMsg)));
      }else if (state is AuthErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.msg,)));
      }
    },
    child: Scaffold(
      appBar: AppBar(title: const Text("Sign UP Page"),centerTitle: true,backgroundColor: Colors.greenAccent,),
      body: Center(child: BlocBuilder(
      bloc: context.read<AuthBloc>(),
      builder:(context, state) {
        if (state is AuthLoadingState) {
          return const LoadingWidget();
        
        }else{
          return const SignUpWidget();
        }
        
      },),),
    ),
    );
  }
}