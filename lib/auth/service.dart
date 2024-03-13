import 'dart:developer';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fir_base_auth_demo2/main.dart';
import 'package:flutter_fir_base_auth_demo2/view/Phone_verify_Page/OTP_page/otp_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationServices {
  static AuthenticationServices? _authenticationServices;
  AuthenticationServices._internal();
  factory AuthenticationServices() {
    return _authenticationServices ??= AuthenticationServices._internal();
  }

  FirebaseAuth get getFirebaseAuth => FirebaseAuth.instance;

  Future<User?> creatUser((String email, String password) user) async {
    UserCredential userCredential = await getFirebaseAuth
        .createUserWithEmailAndPassword(email: user.$1, password: user.$2);
    return userCredential.user;
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  // Sign IN With  PHONE NUMBER

  Future<bool> signInWithPhoneNumber({required String phoneNumber}) async {
 try {
     await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'In_Valid_PhoneNumber') {
          if (kDebugMode) {
            print('IN_VALID_PHONE_NUMBER');
          }
        }
      },
      codeSent: (String verificationId, int? forceResendingToken){
        log('[Reached Here]');
        Navigator.of(Navigation.key.currentContext!).pushNamed(OtpPage.name,arguments: verificationId);
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
   
 } catch (e) {
  print('$e');
   
 }
 return true;
  }


//////////////     GET OTP FROM CONTECTS      ////////////////////////////

  Future<UserCredential> getOTPCode({required String  verificationId,required String smsCode})async{
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);
        
        return await auth.signInWithCredential(credential);
  }
  

 


// Sign UP WITH GOOGLE

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
