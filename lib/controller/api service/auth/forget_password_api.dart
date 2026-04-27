import 'dart:developer';
class ForgetPasswordApi {
  static Future<bool> forgetPasswordApi({required String phone}) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return true;
    } catch (e) {
      log("Error: $e");
    }
    return false;
  }
}
