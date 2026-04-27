import 'dart:developer';

import 'package:get/get.dart';
import 'package:pc_mart/Model/productListModel.dart';
import 'package:pc_mart/controller/api%20service/ProductListService.dart';


class HomeController extends GetxController {
  List<Products> finalProductList = [];
  List<Products> productList = [];
  RxList<Products> cardProductList = <Products>[].obs;
  RxBool isLoading = false.obs;
  getProduct() async {
    finalProductList= await ProductListService.productListService();
    isLoading.value = true;
    productList.addAll(finalProductList);
    log("=============finalProductList 1: ${finalProductList.length}");
    log("=============finalProductList 2: ${finalProductList.length}");
    log("=============productList 1: ${productList.length}");
    isLoading.value = false;
  }

  searchFunction({required String searchText}) async {
    isLoading.value = true;
    log("-------------- $searchText");
    productList = finalProductList
        .where((value) =>
    value.nameEn!.toLowerCase().contains(searchText.toLowerCase())  ||
        value.regPrice.toString().contains(searchText))
        .toList();
    log("=================Data : ${productList.length}");
    isLoading.value = false;
  }

  @override
  void onInit() {
    getProduct();

    super.onInit();
  }
}