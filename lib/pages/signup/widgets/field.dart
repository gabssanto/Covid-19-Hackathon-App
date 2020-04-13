import 'package:flutter/material.dart';

class SignupFormField extends StatelessWidget {
  final String hint, label;
  final validator, onSaved;
  final icon;
  final suffixIcon;
  final bool obscureText;
  final inputType;
  final controller;

  SignupFormField({
    this.hint,
    this.label,
    this.validator,
    this.onSaved,
    this.icon,
    this.suffixIcon,
    this.obscureText,
    this.inputType,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 15),
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 15,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText ?? false,
          keyboardType: inputType ?? TextInputType.text,
          decoration: new InputDecoration(
            hintText: '$hint',
            labelText: '$label',
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff27b3ff), width: 1.0),
                borderRadius: BorderRadius.circular(12)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(12)),
            prefixIcon: Padding(
              padding: EdgeInsets.only(top: 0),
              child: icon,
            ),
            suffixIcon: suffixIcon,
          ),
          validator: validator,
          onSaved: onSaved,
        ));
  }
}
