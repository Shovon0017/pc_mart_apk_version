

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_mart/common%20widget/common_button.dart';
import 'package:pc_mart/view/screen/auth/SignIn.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
      appBar:AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: SizedBox(
            height: 40,
            width: 150,
            child: Image.asset("images/pcmart.jpg")),
        centerTitle: true,
      ),
      body:Center(
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal:10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                 const Text("Create a New Account",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 25,color: Color(0xff4d4d4d)),),
               const SizedBox(height: 50),
                const ListTile(
                  leading: Text("Type Your name",style: TextStyle(fontSize: 15,color: Color(0xff4d4d4d)),),
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      hintText: "First And Last Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(width: 1))),
                ),
                 const ListTile(
                  leading: Text("Mobile Number",style: TextStyle(fontSize: 15,color: Color(0xff4d4d4d)),),
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone),
                      hintText: "01xxxxxxxxx",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(width: 1))),
                ),
                 const ListTile(
                  leading: Text("Create a Password",style: TextStyle(fontSize: 15,color: Color(0xff4d4d4d)),),
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      hintText: "Password (8 to 32)",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(width: 1))),
                ),
                 const ListTile(
                  leading: Icon(Icons.check_box_outlined,color: Color(0xff9a0000),),
                  title: Text("By proceeding, you agree to zdrop’s Teams and Conditions",style: TextStyle(fontSize: 13),),
                ),
                 const ListTile(
                  leading: Icon(Icons.check_box_outlined,color: Color(0xff9a0000),),
                  title: Text("By proceeding, you agree to zdrop’s Privacy and Policy",style: TextStyle(fontSize: 13),),
                ),
                CommonButton(buttonName: "Sign Up", onTap: (){
                  Get.to(()=>const SignIn());
                })
              ],
            ),
          ),
        ),
      )
    );
  }
}
