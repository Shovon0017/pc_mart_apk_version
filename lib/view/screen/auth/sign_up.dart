import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_mart/common%20widget/common_button.dart';
import 'package:pc_mart/common%20widget/common_loading_button.dart';
import 'package:pc_mart/controller/getX%20controller/sign_up.dart';
import 'package:pc_mart/view/screen/auth/widget/auth%20%20widget/email_text_field.dart';
import 'package:pc_mart/view/screen/auth/widget/auth%20%20widget/phone.dart';
import 'package:pc_mart/view/screen/auth/widget/confirm_password.dart';


class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController signupController = Get.put(SignUpController());
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        title: const Text("Registration",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: signupController.formKey,
                child: Column(
                  children: [
                    SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset("images/sign up.jpg")),
                    EmailTextField(
                      emailController: signupController.emailController,
                    ),
                    buildSizedBox(height: 10),
                    PhoneTextField(
                        phoneController: signupController.phoneController),
                    buildSizedBox(height: 10),
                    PasswordTextField(
                      passController: signupController.passController,
                    ),
                    buildSizedBox(height: 10),
                    PasswordTextField(
                        passController: signupController.confirmPassController,),
                    buildSizedBox(height: 30),

                    Obx(() => signupController.isLoading.isFalse
                        ? CommonButton(
                        buttonName: "Sign Up",
                        onTap: () {
                          if (!signupController.formKey.currentState!
                              .validate()) {
                            return;
                          }
                          log("==========222222222222===============");
                          signupController.SignUpFun();
                        })
                        : const CommonLoadingButton(),),
                    const SizedBox(height: 10,),
                    // CommonButton(buttonName: "Already have account Sign in", onTap: (){
                    //   Get.to(()=>const SignIn());
                    // })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox({double? height, double? width}) =>
      SizedBox(height: height, width: width);
}
