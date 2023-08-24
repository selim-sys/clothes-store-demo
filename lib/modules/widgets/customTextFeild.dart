import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.hint,
    required this.label,
    required this.onChanged,
    required this.valid,
    required this.isOb,
    this.inputType
  });
  String hint,label,valid;
  Function(String)? onChanged;
  bool isOb = false;
  TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      obscureText: isOb,
      onChanged: onChanged,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(

          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey),
          label: Text(label,
            style: TextStyle(),),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  )
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  width: 3,
                 )
          )
      ),
    );
  }
}
