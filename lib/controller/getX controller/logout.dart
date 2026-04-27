
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_mart/controller/api%20service/auth/log_out.dart';
import 'package:pc_mart/view/screen/auth/SignIn.dart';
class LogOutService extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  logOutFun() async {
    isLoading.value = true;
    bool message = await LogOutApi.logoutApi();
    isLoading.value = false;

    if (message) {
      Get.offAll(() =>   const SignIn());
      return;
    }
  }
}
