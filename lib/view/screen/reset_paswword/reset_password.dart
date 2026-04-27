
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_mart/common%20widget/common_button.dart';
import 'package:pc_mart/common%20widget/common_text.dart';
import 'package:pc_mart/controller/getX%20controller/reset_pass_controller.dart';
import 'package:pc_mart/view/screen/auth/SignIn.dart';
import 'package:pc_mart/view/screen/auth/widget/auth%20%20widget/phone.dart';
import 'package:pc_mart/view/screen/auth/widget/confirm_password.dart';
class ResetPass extends StatelessWidget {
  const ResetPass({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordController controller = Get.put(ResetPasswordController());
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        title: const Text("Reset Password",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 30)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [SizedBox(
                height: 250,
                width: 250,
                child: Image.asset("images/reset_pass.png")),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const CommonText(title: "Enter OTP Number",fSize: 15,),
                    PhoneTextField(phoneController: controller.otpController),
                    const SizedBox(
                      height: 20,
                    ),
                    const CommonText(title: "Enter New Password ",fSize: 15),
                    PasswordTextField(passController: controller.passController),
                    const SizedBox(
                      height: 20,
                    ),
                    const CommonText(title: "Enter Confirm Password ",fSize: 15),
                    PasswordTextField(passController: controller.conPassController),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonButton(
                        buttonName: "Continue",
                        onTap: () {
                          Get.to(()=>const SignIn());
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
