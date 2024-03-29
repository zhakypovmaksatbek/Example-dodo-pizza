import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required this.title,
    this.color,
  });
  final String title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: color ?? Colors.white),
    );
  }
}
