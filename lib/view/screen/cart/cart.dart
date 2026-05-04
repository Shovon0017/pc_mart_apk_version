import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pc_mart/common%20widget/CommonIcon.dart';
import 'package:pc_mart/common%20widget/common_button.dart';
import 'package:pc_mart/common%20widget/custom_order_shimmer_loading.dart';
import 'package:pc_mart/controller/getX%20controller/product_Info.dart';
import 'package:pc_mart/view/screen/OrderInfo/OrderInfo.dart';
import 'package:pc_mart/view/screen/cart/widget/no_cart_data_found.dart' show NoCartProductFoundWidget;
import 'package:pc_mart/view/screen/notification/notification.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    ProductInfoController cartController = Get.put(ProductInfoController());
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: SizedBox(
            height: 40, width: 150, child: Image.asset("images/pcmart.jpg")),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CommonIconButton(onTap: () {
              Get.to(() => const NotificationShow());
            }),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Obx(
                () => cartController.isLoading.isTrue
                ? const CustomOrderShimmer()
                : cartController.cart.isEmpty
                ? const NoCartProductFoundWidget()
                : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        RichText(
                            text: const TextSpan(children: [
                              TextSpan(
                                  text: "Total Item :",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ])),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text("${cartController.cart.length}"),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: size.height / 1.8,
                  child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 10),
                      shrinkWrap: true,
                      itemCount: cartController.cart.length,
                      itemBuilder: (_, index) {
                        var product = cartController.cart[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          surfaceTintColor: Colors.transparent,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(.3),
                                strokeAlign: BorderSide.strokeAlignOutside),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: Image.asset("${product.image}")),
                              Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${product.nameEn}",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Price : ",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                            "${product.regPrice} ৳",
                                            style: const TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          // --- NEW: Item Quantity Selector ---
                                          InkWell(
                                            onTap: () => cartController.decrementQty(index),
                                            child: Container(
                                              decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400), borderRadius: BorderRadius.circular(4)),
                                              child: const Icon(Icons.remove, size: 22, color: Colors.black54),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 12),
                                            child: Text("${product.quantity ?? 1}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                          ),
                                          InkWell(
                                            onTap: () => cartController.incrementQty(index),
                                            child: Container(
                                              decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400), borderRadius: BorderRadius.circular(4)),
                                              child: const Icon(Icons.add, size: 22, color: Colors.black54),
                                            ),
                                          ),
                                          const Spacer(),
                                          InkWell(
                                            onTap: () async {
                                              cartController.removeFromCart(product);
                                            },
                                            child: const Icon(Icons.delete_forever, color: Colors.red),
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
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
            () => cartController.cart.isEmpty
            ? const SizedBox()
            : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              color: const Color(0xffFFEDE5),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "total_amount".tr,
                      style: const TextStyle(fontSize: 18),
                    ),
                    // --- NEW: Reactive Total Amount Display ---
                    Text(
                      "= ${cartController.totalAmount.toStringAsFixed(2)} ৳",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            CommonButton(
              onTap: () async {
                Get.to(() => OrderInfo());
              },
              buttonName: "checkout",
            ),
            const SizedBox(height: 170)
          ],
        ),
      ),
    );
  }
}