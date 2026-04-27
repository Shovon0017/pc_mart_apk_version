import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({super.key, required this.NameController});
  final TextEditingController NameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: NameController,
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
          labelText: "Name"
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