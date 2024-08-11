// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:chat_me/common/storage_key.dart';
import 'package:chat_me/constant/app_colors.dart';
import 'package:chat_me/main.dart';
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  String _contryCode = '+91';

  String get contryCode => _contryCode;
  void setContryCode(String value) {
    _contryCode = value;
    notifyListeners();
  }

  bool isCodeSent = false;

  String _verificationId = '';
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    _setLoading(true);

    await _auth.verifyPhoneNumber(
      phoneNumber: contryCode + phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        _setLoading(false);
        // Handle successful login
      },
      verificationFailed: (FirebaseAuthException e) {
        _setLoading(false);
        // Handle verification failed
        if (kDebugMode) {
          print('Verification failed: ${e.message}');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        log('Code sent: $verificationId');
        _verificationId = verificationId;
        _setLoading(false);
        notifyListeners();
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  Future<bool> signInWithOTP(String smsCode, BuildContext context) async {
    try {
      _setLoading(true);

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsCode,
      );

      var res = await _auth.signInWithCredential(credential);
      log("res=> ${res.user?.uid}");
      storage.write(userUID, res.user?.uid);
      _setLoading(false);
      // Handle successful login

      return true;
    } catch (e) {
      _setLoading(false);
      print('Failed to sign in: $e');
      floatingSnackBar(
        message: _getErrorMessage(e as FirebaseAuthException),
        context: context,
        textColor: Colors.black,
        textStyle: const TextStyle(color: appWhiteColor),
        duration: const Duration(milliseconds: 4000),
        backgroundColor: red,
      );

      return false;
    }
  }

  String _getErrorMessage(FirebaseAuthException e) {
    if (e.code == 'invalid-verification-code') {
      return "The verification code from SMS/TOTP is invalid. Please check and enter the correct verification code again.";
    }
    // Add more error cases as needed
    return e.message ?? "An unexpected error occurred. Please try again.";
  }
}
