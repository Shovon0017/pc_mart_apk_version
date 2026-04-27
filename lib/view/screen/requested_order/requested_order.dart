import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_mart/common%20widget/CommonIcon.dart';
import 'package:pc_mart/common%20widget/common_button.dart';
import 'package:pc_mart/controller/getX%20controller/product_Info.dart';
import 'package:pc_mart/view/screen/navigation%20bar/navigation.dart';
import 'package:pc_mart/view/screen/notification/notification.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    ProductInfoController controller=Get.put(ProductInfoController());
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text("Requested Order",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
             SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 180,
              width: double.infinity,
              child:
              Card(
                color: Color(0xff9a0000),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("On The Way To China!",style: TextStyle(fontSize: 30,color: Colors.white),),
                    Text("Estimated Delivery Date Is",style: TextStyle(fontSize: 30,color: Colors.white),),
                    Text("23 October - 29 October",style: TextStyle(fontSize: 30,color: Colors.white)),
                  ],
                ),
              ),
            ),
            SizedBox(
             height: 80,
              width: double.infinity,
              child:
              Card(
                color: CupertinoColors.systemGrey4,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                              text: "Delivery Partner :",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text: "BD-DEX",
                              style: TextStyle(fontSize: 20, color: Colors.black))
                        ])),
                    RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                              text: "Tracking Number:",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text: "DEX-BND-00000981234",
                              style: TextStyle(fontSize: 20, color: Color(0xff9a0000)))
                        ])),

                  ],
                ),
              ),
            ),
            SizedBox(
              height: 80,
              width: double.infinity,
              child:
              Card(
                color: CupertinoColors.systemGrey4,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                              text: "Receiver Name:",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text: "User-001",
                              style: TextStyle(fontSize: 20, color: Colors.black))
                        ])),
                    RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                              text: "Address:",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text: "House 09,Road 5,Bheramara,Kushtia",
                              style: TextStyle(fontSize: 20, color: Colors.black,overflow: TextOverflow.ellipsis))
                        ])),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child:
              Card(
                color: CupertinoColors.systemGrey4,
                child: Obx(
                      () => ListView.builder(
                      padding: const EdgeInsets.only(bottom: 10),
                      shrinkWrap: true,
                      itemCount: controller.cart.length,
                      itemBuilder: (_, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          surfaceTintColor: Colors.transparent,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(.3), strokeAlign: BorderSide.strokeAlignOutside),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                  height: 80,
                                  width:80,child: Image.asset("${controller.cart[index].image}")),

                              Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${controller.cart[index].nameEn}",style: TextStyle(fontSize: 20,overflow: TextOverflow.ellipsis),),
                                      Row(
                                        children: [
                                          Text(
                                            "Price : ",style: TextStyle(
                                            fontSize: 20,
                                          ),
                                          ),
                                          Text(
                                            "${controller.cart[index].regPrice} ৳",style: TextStyle(
                                            fontSize: 20,
                                          ),

                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Spacer(),
                                          InkWell(
                                            onTap: () async {
                                              controller.cart.removeAt(index);
                                            },
                                            child: InkWell(onTap: (){
                                              Get.offAll(()=>NavigationBarShow());
                                            },
                                              child: CommonButton(buttonName: "Buy Again",buttonColor: Color(0xff9a0000),textColor: Colors.white,buttonHeight: 25,buttonWidth: 120, onTap:(){
                                                Get.offAll(()=>NavigationBarShow());
                                              })
                                            ),
                                          ),
                                          const SizedBox(width: 10)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
