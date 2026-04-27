import 'package:flutter/material.dart';

class NumberTextField extends StatelessWidget {
  const NumberTextField({super.key, required this.NumberController});
  final TextEditingController NumberController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: NumberController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          focusedBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red)),
          labelText: "Phone Number"
      ),
      validator: (value) {
        if (value == "" || value == null) {
          return "Field can't be empty";
        }
        return null;
      },
    );
  }
}