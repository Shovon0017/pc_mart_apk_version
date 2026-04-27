

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_mart/common%20widget/common_button.dart';

import '../auth/SignIn.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor:  const Color(0xffFFFFFF),
      body: Center(
        child:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/Startpage.jpg"),
              const SizedBox(
                height: 200,
              ),
              CommonButton(buttonColor:const Color(0xff9a0000)
                  ,buttonName: "GET STARTED", onTap:(){
              Get.to(()=>const SignIn())  ;
              })
            ],
          ),
        ),
      ),
    );
  }
}
