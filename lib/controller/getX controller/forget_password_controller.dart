
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pc_mart/controller/api%20service/auth/forget_password_api.dart';
class ForgetPasswordController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  RxBool isLoading = false.obs;

  checkValidUser() async {
    isLoading.value = true;
    bool otp = await ForgetPasswordApi.forgetPasswordApi(phone: "");
    if (otp) {
      bool status =
      isLoading.value = false;
      if(status) {
        Get.to(()=> ());
      }
    }else{
      isLoading.value = false;
    }
  }
}
