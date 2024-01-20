import 'dart:async';

import 'package:flutter/material.dart';

class TimerNotifier extends ValueNotifier<int> {
  Timer? _timer;
  bool isActive = false;
  final int _timeDurationInSeconds = 1;

  TimerNotifier({required int timerInSeconds}) : super(timerInSeconds);

  void startTimer() {
    isActive = true;
    _timer = Timer.periodic(Duration(seconds: _timeDurationInSeconds), (timer) {
      --value;
      if (value < 0) {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
    isActive = false;
  }
}
