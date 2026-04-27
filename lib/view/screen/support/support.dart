import 'package:flutter/material.dart';
import '../../../common widget/common_button.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Support",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:10),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Container(
               child:Column(
                 children: [
                   Image.asset("images/support pic.png"),const SizedBox(height: 20),
                   const Text("How May we Help you Today",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                   const SizedBox(height: 20),
                   CommonButton(
                       buttonColor: const Color(0xff9a0000),
                       buttonName: "Share the problem in the Facebook group",
                       onTap: () {}),
                   const SizedBox(height: 10),
                   CommonButton(
                       buttonColor: const Color(0xff9a0000),
                       buttonName: "Feedback & Suggesstion",
                       onTap: () {}),
                   const SizedBox(
                     height: 20,
                   )
                 ],
               ),
             ),
              Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Card(color: const Color(0xffE9E9E9),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Column(
                              children: [
                                SizedBox(height: 70,
                                    width: 70,
                                    child: Image.asset("images/Facebook Messenger.png")),
                                const Text("Messenger"),
                              ],
                            ),
                          ),SizedBox(
                            height: 100,
                            width: 100,

                            child: Column(
                              children: [
                                SizedBox(height: 70,
                                    width: 70,
                                    child: Image.asset("images/Email.png")),
                                const Text("Email"),
                              ],
                            ),
                          ),SizedBox(
                            height: 100,
                            width: 100,

                            child: Column(
                              children: [
                                SizedBox(height: 70,
                                    width: 70,
                                    child: Image.asset("images/Ring.png")),
                                const Text("Call"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
