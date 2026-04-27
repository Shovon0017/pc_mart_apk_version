import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_mart/view/screen/Profile/profile.dart';
import 'package:pc_mart/view/screen/cart/cart.dart';
import 'package:pc_mart/view/screen/home%20api%20version/home.dart';
class BottomNavBarController extends GetxController {
  final pageController = PageController(initialPage: 0);
  final NotchBottomBarController nController =
  NotchBottomBarController(index: 0);
  RxInt index = 0.obs;
  RxInt maxCount = 3.obs;
  RxInt page = 0.obs;

  List<Widget> bottomBarPages = [
    const Home(),
    const Cart(),
    const Profile()
  ];
  @override
  void onInit() {
    NotchBottomBarController();
    super.onInit();
  }
}

