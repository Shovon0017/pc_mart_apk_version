import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pc_mart/controller/api%20service/auth/sign_up.dart';
import 'package:pc_mart/view/screen/auth/SignIn.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  RxBool isLoading = false.obs;
  final formKey = GlobalKey<FormState>();

  SignUpFun() async {
    Map<String, dynamic> data = {
      "email": emailController.text,
      "phone": phoneController.text,
      "password": passController.text,
      "password_confirmation": confirmPassController.text,
    };
    isLoading.value = true;
    bool status = await SignUpService.signUpService(
        email: emailController.text,
        phone: phoneController.text,
        password: passController.text,
        password_confirmation: confirmPassController.text);
    isLoading.value = false;
    if (status) {
      log("Next Page");
      Get.to(() => const SignIn());
    } else {
      Get.snackbar("", "The email has already been taken");
    }
  }
  @override
  void onInit() {
    emailController.text="Shovon@gmail.com";
    phoneController.text="01643770017";
    passController.text="12345678";
    confirmPassController.text="12345678";
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }
}
