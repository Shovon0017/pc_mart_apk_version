import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pc_mart/Model/add_to_cart_model.dart';
import 'package:pc_mart/database/AddtoCartdata.dart';
class AddToCartService {
  static Future<AddToCartModel?> addToCartService({required String id}) async {
    try {
      AddToCartModel addToCartModel = AddToCartModel.fromJson(jsonDecode(jsonEncode(AddToCartData.addToCartData)));
      return addToCartModel;
    } catch (e) {
      debugPrint("Error : $e");
    }
    return null;
  }
}
