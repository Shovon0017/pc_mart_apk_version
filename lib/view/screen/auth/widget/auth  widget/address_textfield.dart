import 'package:flutter/material.dart';

class AddressTextField extends StatelessWidget {
  const AddressTextField({super.key, required this.AddressController});
  final TextEditingController AddressController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: AddressController,
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
      labelText: "Address"
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