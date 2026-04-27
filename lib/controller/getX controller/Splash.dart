import 'dart:async';

import 'package:get/get.dart';
import 'package:pc_mart/view/screen/start%20page/start_page.dart';
class SplashController extends GetxController {
   nextPage(){
    Timer(const Duration(seconds: 3), (){
      Get.to(()=>const StartPage());
    });
   }
   @override
  void onInit() {
    nextPage();
    super.onInit();
  }
}
