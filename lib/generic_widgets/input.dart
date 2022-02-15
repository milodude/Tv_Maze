import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input(this.controller, this.inputType, this.hint, this.label, this.icon,
      {Key? key})
      : super(key: key);

  final TextEditingController controller;
  final TextInputType inputType;
  final String hint;
  final String label;
  final IconData icon;
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        labelText: label,
        suffixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
