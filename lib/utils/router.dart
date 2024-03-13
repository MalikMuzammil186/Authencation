import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fir_base_auth_demo2/bloc/Sign_in_bloc/auth_bloc.dart';
import 'package:flutter_fir_base_auth_demo2/bloc/phone_bloc/phone_bloc.dart';
import 'package:flutter_fir_base_auth_demo2/view/HomePage/home_page.dart';
import 'package:flutter_fir_base_auth_demo2/view/Phone_verify_Page/OTP_page/otp_page.dart';
import 'package:flutter_fir_base_auth_demo2/view/SignUp_Page/sign_up_page.dart';
import 'package:flutter_fir_base_auth_demo2/view/Phone_verify_Page/phone_page.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePage.name:
      return SlideTransitionPageRoute(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) {
                  return AuthBloc();
                },
              )
            ],
            child: const HomePage(),
          ),
          settings: settings);
    case OtpPage.name:
    return SlideTransitionPageRoute(page: 
    BlocProvider<PhoneBloc>(
      create: (context) => PhoneBloc(),
      child: OtpPage()));
    case SignUpPage.name:
      return SlideTransitionPageRoute(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) {
                  return AuthBloc();
                },
              )
            ],
            child: const SignUpPage(),
          ),
          settings: settings);
    case PhonePage.name:
      return SlideTransitionPageRoute(
          page: BlocProvider(
            create: (context) => PhoneBloc(),
            child: const PhonePage(),
          ),
          settings: settings);

          

    default:
      return SlideTransitionPageRoute(
          page: const Center(
        child: Text(
          "404! PAGE NOT FOUND",
          style: TextStyle(fontSize: 50, color: Colors.red),
        ),
      ));
  }
}

class SlideTransitionPageRoute extends PageRouteBuilder {
  SlideTransitionPageRoute({required this.page, super.settings})
      : super(
            transitionDuration: const Duration(milliseconds: 500),
            reverseTransitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondryAnimation, child) =>
                    SlideTransition(
                      position: Tween<Offset>(
                              begin: const Offset(1, 1),
                              end: const Offset(0, 1))
                          .animate(animation),
                      child: page,
                    ));
  final Widget page;
}
