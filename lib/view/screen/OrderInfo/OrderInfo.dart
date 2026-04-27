import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_mart/common%20widget/CommonIcon.dart';
import 'package:pc_mart/common%20widget/common_button.dart';
import 'package:pc_mart/controller/getX%20controller/PaymentGetway.dart';
import 'package:pc_mart/view/screen/notification/notification.dart';
import 'package:pc_mart/view/screen/payLater/payLater.dart';
import 'package:pc_mart/view/screen/paymentScreen/paymentscreen.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    PaymentGetwayController homeController = Get.put(PaymentGetwayController());
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar:AppBar(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Order Info",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: "Product Name:",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                TextSpan(
                    text: "Intel Core i9-13900K",
                    style: TextStyle(fontSize: 15, color: Colors.black))
              ])),
              const SizedBox(height: 10),
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: "Quantity:",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                TextSpan(
                    text: "1 piece",
                    style: TextStyle(fontSize: 15, color: Colors.black))
              ])),
              const SizedBox(height: 10),
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: "price:",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                TextSpan(
                    text: "599.99Tk",
                    style: TextStyle(fontSize: 15, color: Colors.black))
              ])),
            const SizedBox(height: 10),
              RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                        text: "Delivery Charge:",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    TextSpan(
                        text: "60Tk",
                        style: TextStyle(fontSize: 15, color: Colors.black))
                  ])),
              const SizedBox(height: 10),
              RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                        text: "Delivery Time:",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    TextSpan(
                        text: "Get by 23-29 sept",
                        style: TextStyle(fontSize: 15, color: Colors.black))
                  ])),
              const SizedBox(height: 10),
              const Text(
                "Customer Info",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: "Email:",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                TextSpan(
                    text: "Shovon@gmail.com",
                    style: TextStyle(fontSize: 15, color: Colors.black))
              ])),
              const SizedBox(height: 10),
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: "Billing Address:",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                TextSpan(
                    text: "Sector-12,Uttara,Dhaka",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))
              ])),
              const SizedBox(height: 10),
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: "Contact:",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                TextSpan(
                    text: "+8801847158301, +8801847158302",
                    style: TextStyle(fontSize: 15, color: Colors.black))
              ])),
              const SizedBox(height: 10),
              CommonButton(
                  buttonColor: const Color(0xff9a0000),
                  buttonName: "Pay Now", onTap: ()async{
                debugPrint("=========== Start Call ============");
                await homeController.sslCommerzCustomizedCall();
                Get.offAll(()=>const PaymentScreen());
                debugPrint("=========== End Call ============");
              }),
              CommonButton(
                buttonColor: Colors.grey,
                  buttonName: "Pay Later", onTap: (){
                  Get.to(()=>const Paylater());
              })
            ],
          ),
        ),
      ),
    );
  }
}
