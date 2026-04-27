

import 'package:flutter/material.dart';
import 'package:pc_mart/view/screen/FAQ/search_FAQ.dart';class FAQ extends StatelessWidget {
  const FAQ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0xffFFFFFF),
      appBar:AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: SizedBox(
            height: 32,
            width: 114,
            child: Image.asset("images/pcmart.jpg")),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:10),
          child: Column(
            children: [
              const Text("FAQ",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SearchFieldFAQ(onChanged: (String Text){
              }),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    physics: const PageScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context,index){
                      return const SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: Card(
                          elevation: 5,
                          color: Color(0xffFFFFFF),
                          child: Row(
                            children: [
                              Icon(Icons.keyboard_arrow_right_outlined),
                              Text("How to Book a Doctor?")
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),

    );
  }
}
