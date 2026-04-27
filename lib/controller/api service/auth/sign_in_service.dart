import 'package:flutter/material.dart';

class SignInService {
  static Future<bool> signInService({
    required String email,
    required String password,
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
