import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pc_mart/Model/productInfoModel.dart';
import 'package:pc_mart/database/productInfo.dart';
class ProductInfoService {
  static Future<ProductInfoModel?> productInfoService({required String id}) async {
    try {
      ProductInfoModel descriptionModel = ProductInfoModel.fromJson(jsonDecode(jsonEncode(ProductInfoData.productInfoData)));
      return descriptionModel;
    } catch (e) {
      debugPrint("Error : $e");
    }
    return null;
  }
}
