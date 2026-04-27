import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_mart/common%20widget/common_button.dart';

class SearchField extends StatelessWidget {
   SearchField({super.key,
    required this.onChanged});
  final void Function(String) onChanged;
var value=-1;
  @override
  Widget build(BuildContext context) {
    return TextField(
      // controller: searchController,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide:  const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color:CupertinoColors.systemGrey3),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide:  const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(8)),
        labelText: "Search Computer Accessories",
        suffixIcon: InkWell(
            onTap: (){
              Get.defaultDialog(
                  title: "Filter",
                  titleStyle: const TextStyle(
                      color:Color(0xff9a0000), fontWeight: FontWeight.bold),
                  content: Column(
                    children: [
                      DropdownButtonFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: Colors.black))),
                          value: value,
                          items: const [
                            DropdownMenuItem(
                              value: -1,
                              child: Text("Accessories"),
                            ),
                            DropdownMenuItem(
                                value: 0,
                                child: Text("Mouse")),
                            DropdownMenuItem(
                                value: 1,
                                child: Text("Keyboard")),
                            DropdownMenuItem(
                                value: 2,
                                child: Text("Headphone"))
                          ],
                          onChanged: (v) {}),
                      const SizedBox(height: 10),
                      DropdownButtonFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: Colors.black))),
                          value: value,
                          items: const [
                            DropdownMenuItem(
                              value: -1,
                              child: Text("HardWare"),
                            ),
                            DropdownMenuItem(
                                value: 0,
                                child: Text("Ram")),
                            DropdownMenuItem(
                                value: 1,
                                child: Text("SSD")),
                            DropdownMenuItem(
                                value: 2,
                                child: Text("Cooling System"))
                          ],
                          onChanged: (v) {}),
                      const SizedBox(height: 10),
                      DropdownButtonFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: Colors.black))),
                          value: value,
                          items: const [
                            DropdownMenuItem(
                              value: -1,
                              child: Text("MotherBoard"),
                            ),
                            DropdownMenuItem(
                                value: 0,
                                child: Text("Msi")),
                            DropdownMenuItem(
                                value: 1,
                                child: Text("Gygabyte")),
                            DropdownMenuItem(
                                value: 2,
                                child: Text("ColorFull"))
                          ],
                          onChanged: (v) {}),
                      const SizedBox(height: 10),
                      CommonButton(
                          buttonName: "Search", onTap: () => Get.back())
                    ],
                  ));
            },
            child: const Card(color:Color(0xff9a0000),child: Icon(Icons.search,color: Colors.white,)))
      ),
    );
  }
}
