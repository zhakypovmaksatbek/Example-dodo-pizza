import 'package:flutter/material.dart';

class DefaultTextFormWidget extends StatelessWidget {
  const DefaultTextFormWidget({
    super.key,
    required this.controller,
    required this.hintText,
  });
  final TextEditingController controller;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xffF0EFEF),
          hintText: hintText,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12))),
    );
  }
}
