

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_mart/common%20widget/common_button.dart';
import 'package:pc_mart/controller/getX%20controller/forget_password_controller.dart';
import 'package:pc_mart/view/screen/auth/widget/auth%20%20widget/phone.dart';
import 'package:pc_mart/view/screen/reset_paswword/reset_password.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});
  @override
  Widget build(BuildContext context) {
    ForgetPasswordController controller = Get.put(ForgetPasswordController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        title: const Text("Forget Password",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 30),),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Center(
          child:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Image.asset("images/forget_pass.png"),
                const SizedBox(height: 10),
                PhoneTextField(phoneController:controller.phoneController),
                const SizedBox(height: 10),
                CommonButton(buttonName: "Sent OTP", onTap: (){
                  Get.to(()=>const ResetPass());
                  // controller.checkValidUser();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
