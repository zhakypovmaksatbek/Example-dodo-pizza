// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:example/presentation/theme/color_constants.dart';
import 'package:example/presentation/widgets/text_widgets/def_text.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    required this.title,
    this.color,
  });
  final void Function()? onPressed;
  final String title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .4,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? ColorConstants.blue,
          ),
          onPressed: onPressed,
          child: DefaultText(
            title: title,
            color: ColorConstants.white,
          )),
    );
  }
}
