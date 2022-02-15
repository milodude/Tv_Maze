import 'package:flutter/material.dart';

///Widget that lets you create a TextFormField.
class Input extends StatelessWidget {
  ///Constructor which takes a TextEditingController, a TextInputType, a string to show a hint, a string as a label  and an icon 
  const Input(this.controller, this.inputType, this.hint, this.label, this.icon,
      {Key? key})
      : super(key: key);
///TextEditingController
  final TextEditingController controller;
  ///TextInputType
  final TextInputType inputType;
  ///String to show a hint
  final String hint;
  ///String to show a label
  final String label;
  ///Icon to be display in the input
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
