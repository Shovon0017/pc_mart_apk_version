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

  // --- NEW: Dynamic Total Amount Calculation ---
  double get totalAmount {
    double sum = 0.0;
    for (var item in cart) {
      double price = double.tryParse(item.regPrice.toString()) ?? 0.0;
      int qty = item.quantity ?? 1; // Pulls quantity from your model
      sum += (price * qty);
    }
    return sum;
  }

  // --- NEW: Quantity Controls ---
  void incrementQty(int index) {
    cart[index].quantity = (cart[index].quantity ?? 1) + 1;
    cart.refresh(); // Tells the UI to update
    _saveCart();
  }

  void decrementQty(int index) {
    if ((cart[index].quantity ?? 1) > 1) {
      cart[index].quantity = (cart[index].quantity ?? 1) - 1;
      cart.refresh(); // Tells the UI to update
      _saveCart();
    }
  }

  ProductInfoFun() async {
    try {
      isLoading.value = true;
      id = await Get.arguments ?? "0";
      var a = await ProductInfoService.productInfoService(id: id);
      if (a?.productDetails != null) {
        imageList.clear();
        for (var i in a?.productDetails?.images ?? []) {
          imageList.add(i.toString());
        }

        var data = {
          "rating": a?.productDetails?.rating ?? "",
          "review": a?.productDetails?.review ?? "",
          "description": a?.productDetails?.description?.en ?? "",
        };
        detailsData.value = data;
      }
    } finally {
      isLoading.value = false;
    }
  }

  void addToCart(Products product) {
    // Check if the product is already in the cart
    int index = cart.indexWhere((p) => p.productId == product.productId);

    if (index != -1) {
      // If it exists, just increase the quantity
      cart[index].quantity = (cart[index].quantity ?? 1) + 1;
      cart.refresh();
      Get.snackbar('Cart Updated', 'Increased quantity of ${product.nameEn}');
    } else {
      // If it doesn't exist, add it
      product.quantity = 1; // Ensure new items start at 1
      cart.add(product);
      Get.snackbar('Success', '${product.nameEn} added to cart!');
    }
    _saveCart();
  }

  void removeFromCart(Products product) {
    cart.removeWhere((p) => p.productId == product.productId);
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