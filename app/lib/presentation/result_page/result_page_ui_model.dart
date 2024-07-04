import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class UIData {
  final ScoreResult result;
  final String title;
  final String resultLabel;
  final Color progressBarColor;

  UIData({
    required this.result,
    required this.title,
    required this.resultLabel,
    required this.progressBarColor,
  });
}

class ResultPageUiModel {
  static UIData getUiData(ScoreResult result) {
    switch (result) {
      case ScoreResult.healthy:
        return UIData(
          result: result,
          title: 'Congratulations!',
          resultLabel: 'Healthy',
          progressBarColor: const Color.fromRGBO(4, 199, 97, 1),
        );
      case ScoreResult.average:
        return UIData(
          result: result,
          title: 'There is room for improvement.',
          resultLabel: 'Average',
          progressBarColor: const Color.fromRGBO(255, 192, 50, 1),
        );
      case ScoreResult.unhealthy:
        return UIData(
          result: result,
          title: 'Caution!',
          resultLabel: 'Unhealthy',
          progressBarColor: const Color.fromRGBO(211, 42, 54, 1),
        );
    }
  }
}
