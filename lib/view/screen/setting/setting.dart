
import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: SizedBox(
            height: 32,
            width: 114,
            child: Image.asset("images/pcmart.jpg")),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal:10),
        child: Column(
          children: [
            Text("Setting",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Card(
                elevation: 5,
                color: Color(0xffFFFFFF),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left:20),
                      child: Text("Language"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Card(
                elevation: 5,
                color: Color(0xffFFFFFF),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left:20),
                      child: Text("About"),
                    ),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
