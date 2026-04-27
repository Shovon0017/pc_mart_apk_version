import 'dart:developer';
class AddToCartService {
  static Future<bool> cartService({required int id}) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return true;
    } catch (e) {
      log("Error: $e");
    }
    return false;
  }
}
