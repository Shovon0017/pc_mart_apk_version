
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pc_mart/Model/productListModel.dart';
import 'package:pc_mart/controller/api%20service/product_description.dart';

class ProductInfoController extends GetxController {
  RxInt selectedImgIndex = 0.obs;
  RxInt productQty = 1.obs;
  var detailsData = {}.obs;
  RxList<String> imageList = <String>[].obs;
  String id = "0";
  RxDouble productAmount = 0.00.obs;
  RxBool isLoading = false.obs;
  RxList<Products> cart = <Products>[].obs;
  final GetStorage storage = GetStorage();
  @override
  void onInit() {
    _loadCart();
    super.onInit();
  }

  ProductInfoFun() async {
    id = await Get.arguments ?? "0";
    var a = await ProductInfoService.productInfoService(id: id);
    if (a?.productDetails != null) {
      for (var i in a?.productDetails?.images ?? []) {
        imageList.add(i.toString());
      }

      var data = {
        "rating": a?.productDetails?.rating ?? "",
        "review": a?.productDetails?.review ?? "",
        "description": a?.productDetails?.description?.en ?? "",
      };
      detailsData.addAll(data);
    }
  }



  void addToCart(Products product) {
    cart.add(product);
    _saveCart();
    Get.snackbar('Success', '${product.nameEn} added to cart!');
  }

  void removeFromCart(Products product) {
    cart.remove(product);
    _saveCart();
    Get.snackbar('Removed', '${product.nameEn} removed from cart!');
  }

  void _saveCart() {
    storage.write('cart', cart.map((product) => product.toJson()).toList());
  }

  void _loadCart() {
    var savedCart = storage.read('cart') ?? [];
    cart.value = List<Products>.from(savedCart.map((item) => Products.fromJson(item)));
  }
}
