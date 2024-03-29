import 'dart:async';

import 'package:flutter/material.dart';

class StateProvider extends ChangeNotifier {
  int currentStep = 0;
  int secondsElapsed = 60;

  void nextStep() {
    if (currentStep < 3 - 1) {
      currentStep += 1;
      notifyListeners();
    } else if (currentStep == 1) {
      startTimer();
    }
  }

  StepState stepState(int step) {
    if (currentStep == step) {
      return StepState.editing;
    } else if (currentStep > step) {
      return StepState.complete;
    } else {
      return StepState.indexed;
    }
  }

  void onStepTapped(int value) {
    currentStep = value;
    notifyListeners();
  }

  late Timer timer;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      secondsElapsed--;
      if (secondsElapsed <= 0) {
        timer.cancel();
        notifyListeners();
      }
      notifyListeners();
    });
  }
}
