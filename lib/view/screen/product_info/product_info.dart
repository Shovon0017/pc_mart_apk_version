


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_mart/Model/productListModel.dart';
import 'package:pc_mart/common%20widget/CommonIcon.dart';
import 'package:pc_mart/common%20widget/common_button.dart';
import 'package:pc_mart/controller/getX%20controller/product_Info.dart';
import 'package:pc_mart/view/screen/notification/notification.dart';


class ProductInfo extends StatelessWidget {
   ProductInfo({super.key, required this.id, required this.productData});
  final int id;
  var value=-1;
   final Products productData;
  @override
  Widget build(BuildContext context) {
    ProductInfoController controller = Get.put(ProductInfoController());
    controller.productAmount.value = double.parse(productData.regPrice.toString());

    return Scaffold(backgroundColor: Colors.white,
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
      body:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10),
            child: Column(
              children: [
                Container(
                  height: 230,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 230,
                        child: Image.asset("${productData.image}")
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
               Text("Rating:${productData.nameEn}"),
                const SizedBox(height: 10),
                Text("Brand:${productData.brand}"),
                const SizedBox(height: 10),
                Text("Stock:${productData.stock}"),
                const SizedBox(height: 10),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border:const Border.fromBorderSide(BorderSide(color: Colors.black))),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Description:Welcome to Our Supershop! Discover a wide range of quality products at unbeatable prices. From fresh groceries and household essentials to the latest gadgets and fashion, we have everything you need in one place. Enjoy the convenience of shopping from home and paying securely with cash on delivery.",style: TextStyle(fontSize: 16),),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonButton(
                      buttonWidth: 150,
                        buttonColor: const Color(0xff9a0000),
                        buttonName: "Buy Now", onTap: () {  },
                        ),
                    CommonButton(
                      buttonWidth:150,
                        buttonName: "Add to cart", onTap: ()async{
                      controller.addToCart(Products(nameEn: productData.nameEn,regPrice: productData.regPrice,image: productData.image,quantity: productData.quantity));
                    })
                  ],
                )
              ],
            ),
          ),
    );
  }
}