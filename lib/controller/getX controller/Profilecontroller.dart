import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  RxInt selectedTab = 0.obs;
  RxInt selectedOrderTab = 1.obs;
  RxBool languageBN = true.obs;
  RxBool themeLight = true.obs;
  RxBool isLoading = false.obs;
  RxMap<dynamic, dynamic> userInfo = {}.obs;
  ImageSource imageSource = ImageSource.camera;
  late Rx<File?> profileIMG = Rx<File?>(null);
  final picker = ImagePicker();

  getImage() async {
    var status = await Permission.photos.request();
    log("===========  status : ${status}  =============");
    if (status.isGranted) {
      final pickedFile =
      await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);
      if (pickedFile != null) {
        profileIMG.value = File(pickedFile.path);
      }
    } else {}
  }

  Future<bool> accountDeleteService() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    return true;
  }

  Future<bool> profileUpdateService() async {
    Map<String, dynamic> mapData = {
      "email": mailController.text,
      "phone": phoneController.text,
      "username": "user${mailController.text}",
      "name": nameController.text
    };
    isLoading.value = true;
    // bool status = await ProfileUpdateService.profileUpdateService(image: File(profileIMG.value?.path ?? ""), data: mapData);
    isLoading.value = false;
    return true;
  }

  @override
  void dispose() {
    nameController.dispose();
    mailController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
