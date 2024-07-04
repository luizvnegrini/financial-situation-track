import 'package:design_system/design_system.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import 'result_page_providers.dart';

class ResultPage extends HookConsumerWidget {
  final ScoreResult result;
  const ResultPage({required this.result, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HookConsumer(
      builder: (_, ref, __) {
        useResultState(ref, result);

        const resultLabel = 'Healthy';
        const resultLabelColor = Color.fromRGBO(77, 100, 117, 1);

        return ScaffoldWidget(
          backgroundColor: const Color.fromRGBO(244, 248, 250, 1),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const PageHeaderDescription(
                text: '''Here's your final ''',
                boldText: 'final wellness score.',
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/circular-logo.png',
                          package: 'design_system',
                          height: 48,
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Congratulations!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            text: 'Your financial wellness score is \n',
                            style: TextStyle(
                              color: resultLabelColor,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '$resultLabel.',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: resultLabelColor,
                                  height: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        Button(
                          onPressed: context.pop,
                          enabled: true,
                          child: const Text('Return'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 36),
              const EncryptionDisclaimer(),
            ],
          ),
        );
      },
    );
  }
}
