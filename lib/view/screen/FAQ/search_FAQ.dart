import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchFieldFAQ extends StatelessWidget {
  const SearchFieldFAQ({super.key,

    required this.onChanged});
  final void Function(String) onChanged;

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
          labelText: "Search FAQ",
          suffixIcon: const Card(color:Colors.blue,child: Icon(Icons.search,color: Colors.white,))
      ),
    );
  }
}
