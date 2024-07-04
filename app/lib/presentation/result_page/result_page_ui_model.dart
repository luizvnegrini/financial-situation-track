import 'package:design_system/design_system.dart';
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
  static UIData getUiData(BuildContext context, ScoreResult result) {
    switch (result) {
      case ScoreResult.healthy:
        return UIData(
          result: result,
          title: 'Congratulations!',
          resultLabel: 'Healthy',
          progressBarColor: context.colors.healthy,
        );
      case ScoreResult.average:
        return UIData(
          result: result,
          title: 'There is room for improvement.',
          resultLabel: 'Average',
          progressBarColor: context.colors.average,
        );
      case ScoreResult.unhealthy:
        return UIData(
          result: result,
          title: 'Caution!',
          resultLabel: 'Unhealthy',
          progressBarColor: context.colors.unhealthy,
        );
    }
  }
}
