import 'package:example/presentation/constants/input_validate.dart';
import 'package:example/presentation/provider/state_provider.dart';
import 'package:example/presentation/screens/register_page.dart';
import 'package:example/presentation/widgets/text_fields.dart/number_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepOne extends StatefulWidget {
  const StepOne({super.key});

  @override
  State<StepOne> createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StateProvider>();

    return Form(
      key: globalKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NumberTextFiledWidget(
            controller: controller,
            validator: InputValidate.instance.validatePhoneNumber,
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Checkbox.adaptive(
                value: true,
                onChanged: (value) {},
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black87),
                    text: "Подтверждая, вы соглашаетесь с ",
                    children: <TextSpan>[
                      TextSpan(
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        text: "политикой о конфиденциальности ",
                        recognizer: TapGestureRecognizer()..onTap = () async {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          DefElevatedButton(
            title: "Продолжить",
            onPressed: () {
              if (globalKey.currentState!.validate()) {
                provider.nextStep();
                provider.startTimer();
              }
              return;
            },
          )
        ],
      ),
    );
  }
}
