

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_mart/common%20widget/CommonIcon.dart';
import 'package:pc_mart/common%20widget/common_button.dart';
import 'package:pc_mart/view/screen/navigation%20bar/navigation.dart';
import 'package:pc_mart/view/screen/notification/notification.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: SizedBox(
            height: 32,
            width: 114,
            child: Image.asset("images/pcmart.jpg")),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CommonIconButton(onTap: (){
              Get.to(()=>const NotificationShow());
            }),
          )
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(

                child: Image.asset("images/payment.gif",fit: BoxFit.fill,)),
            const Text("Payment Gateway",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            const SizedBox(
              height: 30,
            ),
            CommonButton(
                buttonColor: const Color(0xff9a0000),
                buttonName: "Payment Done", onTap: (){
                  Get.offAll(()=>const NavigationBarShow());
            })
          ],
        ),
      ),
    );
  }
}
