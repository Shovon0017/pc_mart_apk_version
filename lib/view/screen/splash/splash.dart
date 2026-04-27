

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_mart/controller/getX%20controller/Splash.dart';
class Splash extends StatefulWidget {

  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(backgroundColor: const  Color(0xffFFFFFF),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/pcmart.jpg",)
          ],
        ),
      ),
    );
  }
}
