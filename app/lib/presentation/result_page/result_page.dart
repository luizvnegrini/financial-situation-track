import 'package:design_system/design_system.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import 'result_page_providers.dart';
import 'result_page_ui_model.dart';

class ResultPage extends HookConsumerWidget {
  final ScoreResult result;
  const ResultPage({required this.result, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useResultState(ref, result);
    final uiModel = ResultPageUiModel.getUiData(result);

    return ScaffoldWidget(
      backgroundColor: const Color.fromRGBO(244, 248, 250, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VGap.xxxs(),
          const PageHeaderDescription(
            text: '''Here's your final ''',
            boldText: 'final wellness score.',
          ),
          const VGap.xxs(),
          _Card(uiModel: uiModel),
          const VGap.sm(),
          const EncryptionDisclaimer(),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final UIData uiModel;

  const _Card({required this.uiModel});

  @override
  Widget build(BuildContext context) {
    const resultLabelColor = Color.fromRGBO(77, 100, 117, 1);
    const defaultProgressBarItemColor = Color.fromRGBO(244, 248, 250, 1);
    const defaultDuration = Duration(milliseconds: 600);
    const defaultDelay = Duration(milliseconds: 160);

    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(kSpacingXXXS),
          child: Column(
            children: [
              Image.asset(
                'assets/images/circular-logo.png',
                package: 'design_system',
                height: 48,
              ),
              const VGap.xxs(),
              ProgressBar(
                color: uiModel.progressBarColor,
                progressBarItems: [
                  AnimatedProgressBarItem(
                    color: uiModel.progressBarColor,
                    duration: defaultDuration,
                  ),
                  AnimatedProgressBarItem(
                    color: uiModel.result == ScoreResult.healthy ||
                            uiModel.result == ScoreResult.average
                        ? uiModel.progressBarColor
                        : defaultProgressBarItemColor,
                    duration: defaultDuration,
                    delay: defaultDelay,
                  ),
                  AnimatedProgressBarItem(
                    color: uiModel.result == ScoreResult.healthy
                        ? uiModel.progressBarColor
                        : defaultProgressBarItemColor,
                    duration: defaultDuration,
                    delay: defaultDelay + defaultDelay,
                  ),
                ],
              ),
              const VGap.xxs(),
              Text(
                uiModel.title,
                style: const TextStyle(
                  fontFamily: 'Rubik',
                  package: 'design_system',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const VGap.quarck(),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Your financial wellness score is \n',
                  style: const TextStyle(
                    fontFamily: 'Work Sans',
                    package: 'design_system',
                    fontSize: kSpacingXXXS,
                    fontWeight: FontWeight.w400,
                    color: resultLabelColor,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: uiModel.resultLabel,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: resultLabelColor,
                        height: 2,
                      ),
                    ),
                  ],
                ),
              ),
              const VGap.xs(),
              Button.light(
                onPressed: context.pop,
                enabled: true,
                label: 'Return',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
