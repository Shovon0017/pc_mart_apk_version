
import 'package:flutter/material.dart';

class NotificationShow extends StatelessWidget {
  const NotificationShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0xffFFFFFF),
      appBar:  AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: SizedBox(
            height: 40,
            width: 150,
            child: Image.asset("images/pcmart.jpg")),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Text("Notification",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
                physics: const PageScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index){
                return const SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Card(
                    elevation: 4,
                    color: Colors.white,
                    child: Center(child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Horem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum.",style: TextStyle(fontWeight: FontWeight.bold),),
                    )),
                  ),
                );
            }),
          )
        ],
      ),
    );
  }
}
