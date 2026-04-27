import 'package:flutter/material.dart';

class OtpApi {
  static Future<bool> otpApi({
    required String phone,required String otp,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return true;
    } catch (e) {
      debugPrint("Error : $e");
    }
    return false;
  }
}
