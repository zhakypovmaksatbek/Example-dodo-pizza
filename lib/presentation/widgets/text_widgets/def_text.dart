// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  const DefaultText({
    super.key,
    required this.title,
    this.color,
    this.textAlign,
    this.fontWeight,
  });
  final String title;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(color: color ?? Colors.black, fontWeight: fontWeight),
    );
  }
}
