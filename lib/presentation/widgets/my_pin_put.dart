import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class MyPinPut extends StatefulWidget {
  const MyPinPut({
    super.key,
    required this.controller,
    this.onCompleted,
    this.validator,
  });
  final TextEditingController controller;
  final void Function(String)? onCompleted;
  final String? Function(String?)? validator;
  @override
  State<MyPinPut> createState() => _MyPinPutState();
}

class _MyPinPutState extends State<MyPinPut> {
  final defaultPinTheme = PinTheme(
    width: 40,
    height: 40,
    textStyle: const TextStyle(
        fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: Colors.grey),
    ),
  );
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        // Specify direction if desired
        textDirection: TextDirection.ltr,
        child: Center(
          child: Pinput(
            crossAxisAlignment: CrossAxisAlignment.center,
            controller: widget.controller,
            focusNode: focusNode,
            defaultPinTheme: defaultPinTheme,
            separatorBuilder: (index) => const SizedBox(width: 8),
            validator: widget.validator,
            hapticFeedbackType: HapticFeedbackType.lightImpact,
            onCompleted: widget.onCompleted,
            autofocus: true,
            obscureText: true,
            cursor: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 9),
                width: 10,
                height: 1,
                color: Colors.grey,
              ),
            ),
            pinAnimationType: PinAnimationType.rotation,
            focusedPinTheme: defaultPinTheme.copyWith(
              textStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                  color: Colors.grey),
            ),
            submittedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                color: Colors.green,
                borderRadius: BorderRadius.circular(19),
                border: Border.all(color: Colors.grey),
              ),
            ),
            errorPinTheme: defaultPinTheme.copyDecorationWith(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(6)),
          ),
        ));
  }
}
