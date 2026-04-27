
import 'dart:convert';
import 'dart:developer';

import 'package:pc_mart/Model/productListModel.dart';
import 'package:pc_mart/database/productList.dart';

class ProductListService{
  static Future<List<Products>> productListService()async{
    log("+++++++++");
    try{
      ProductLIstModel allproduct=ProductLIstModel.fromJson(jsonDecode(jsonEncode(ProductList.productlist)));
      log("${allproduct.products}");
      return allproduct.products??[];
    }
    catch(e){
      log("error:$e");
    }
    return[];

  }
}