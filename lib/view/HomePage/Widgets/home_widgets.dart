import 'package:flutter/material.dart';
import 'package:flutter_fir_base_auth_demo2/view/SignUp_Page/sign_up_page.dart';
import 'package:flutter_fir_base_auth_demo2/view/Phone_verify_Page/phone_page.dart';
import 'package:flutter_fir_base_auth_demo2/view/sign_in_Google/google_page.dart';


class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(SignUpPage.name);
          },
          child: const Text('Sign up page'),
        ),
        ElevatedButton(
          onPressed: () {
          },
          child: const Text('Sign in page'),
        ),
        ElevatedButton(
          onPressed: () {
              Navigator.of(context).pushNamed(PhonePage.name);
          },
          child: const Text('Sign in with phone no'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder:(context) => GoogleSignInPage(),));

          },
          child: const Text('Sign in with google'),
        ),
      ],
    );
  }
}
