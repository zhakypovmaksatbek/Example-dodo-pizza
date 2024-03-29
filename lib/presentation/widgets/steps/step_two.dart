import 'package:example/presentation/provider/state_provider.dart';
import 'package:example/presentation/widgets/my_pin_put.dart';
import 'package:example/presentation/widgets/text_widgets/def_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepTwo extends StatelessWidget {
  StepTwo({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StateProvider>();
    return Column(
      children: [
        MyPinPut(
          controller: _controller,
          onCompleted: (p0) {
            provider.nextStep();
            provider.timer.cancel();
          },
        ),
        const SizedBox(height: 15),
        DefaultText(
          title: "Повторный код через 0:${provider.secondsElapsed}",
          color: const Color(0xff005BED),
        )
      ],
    );
  }
}
