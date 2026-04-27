import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_mart/common%20widget/CommonIcon.dart';
import 'package:pc_mart/common%20widget/common_button.dart';
import 'package:pc_mart/view/screen/navigation%20bar/navigation.dart';
import 'package:pc_mart/view/screen/notification/notification.dart';

class Paylater extends StatelessWidget {
  const Paylater({super.key});

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
        child: Column(
          children: [
            const Text("Order Form",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Order Successfully Created",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 3,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10),
                  child: Container(child: const Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Text("Complete Your Payment In 30 Minute",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                    ],
                  )),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CommonButton(
              buttonWidth:100,
                buttonColor: const Color(0xff9a0000),
                buttonName: "OK", onTap: (){
              Get.offAll(()=>const NavigationBarShow());
            })
          ],
        ),
      ),
    );
  }
}
