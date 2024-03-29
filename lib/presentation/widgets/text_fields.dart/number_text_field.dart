// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:example/presentation/constants/path_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NumberTextFiledWidget extends StatelessWidget {
  const NumberTextFiledWidget({
    super.key,
    required this.controller,
    this.onEditingComplete,
    this.validator,
  });
  final TextEditingController controller;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: [
        MaskTextInputFormatter(
            mask: '(+996) ###-##-##-##',
            filter: {"#": RegExp(r'[0-9]')},
            type: MaskAutoCompletionType.eager)
      ],
      validator: validator,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
          hintText: "(+996) 000 00 00 00",
          prefixIcon: SizedBox(
            height: 12,
            child: SvgPicture.asset(
              SvgAsset.kyrgyzstan.svg,
              height: 1,
              width: 1,
            ),
          ),
          fillColor: Colors.white,
          filled: true,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)))),
    );
  }
}
