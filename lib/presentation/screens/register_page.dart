// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:example/presentation/constants/path_manager.dart';
import 'package:example/presentation/provider/state_provider.dart';
import 'package:example/presentation/widgets/steps/step_one.dart';
import 'package:example/presentation/widgets/steps/step_three.dart';
import 'package:example/presentation/widgets/steps/step_two.dart';
import 'package:example/presentation/widgets/text_widgets/def_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StateProvider>();
    return Scaffold(
        body: Center(
      child: SafeArea(
        child: Stack(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 40),
              SvgPicture.asset(SvgAsset.logo.svg),
              const SizedBox(height: 30),
              Expanded(
                  child: Stepper(
                      controlsBuilder: (context, details) {
                        return const SizedBox();
                      },
                      stepIconBuilder: (stepIndex, stepState) {
                        if (stepState == StepState.complete) {
                          return const Icon(Icons.check, color: Colors.white);
                        } else if (stepState == StepState.disabled) {
                          return const SizedBox();
                        } else if (stepState == StepState.editing) {
                          return const Icon(
                            Icons.circle,
                            color: Colors.white,
                            size: 10,
                          );
                        } else {
                          return const Icon(
                            Icons.circle_outlined,
                            color: Colors.white,
                            size: 10,
                          );
                        }
                      },
                      elevation: 0,
                      currentStep: provider.currentStep,
                      onStepTapped: (value) {
                        provider.onStepTapped(value);
                      },
                      type: StepperType.horizontal,
                      steps: [
                    // Step 1
                    customStep(
                        provider: provider,
                        stepState: 0,
                        content: const StepOne(),
                        title: "Step 1"),
                    // Step 2
                    customStep(
                        provider: provider,
                        stepState: 1,
                        content: StepTwo(),
                        title: 'Step 2'),
                    // Step 3

                    customStep(
                        provider: provider,
                        stepState: 2,
                        content: const StepThree(),
                        title: 'Step 3'),
                  ])),
            ]),
            provider.currentStep == 2
                ? Positioned(
                    right: -120, child: SvgPicture.asset(SvgAsset.circle.svg))
                : const SizedBox(),
          ],
        ),
      ),
    ));
  }

  Step customStep(
      {required StateProvider provider,
      required int stepState,
      required Widget content,
      required String title}) {
    return Step(
      state: provider.stepState(stepState),
      title: const SizedBox(),
      label: Text(title),
      content: content,
      isActive: provider.currentStep == stepState ? true : false,
    );
  }
}

class DefElevatedButton extends StatelessWidget {
  const DefElevatedButton({
    super.key,
    this.onPressed,
    required this.title,
  });
  final void Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style:
            ElevatedButton.styleFrom(backgroundColor: const Color(0xff005BED)),
        onPressed: onPressed,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: DefaultText(
            title: title,
            color: Colors.white,
          ),
        )));
  }
}
