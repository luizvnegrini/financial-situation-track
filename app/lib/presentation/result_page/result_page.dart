import 'package:design_system/design_system.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';

import 'result_page_providers.dart';

class ResultPage extends HookConsumerWidget {
  const ResultPage({super.key});

  SizedBox get defaultSpacer => const SizedBox(height: 16);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final vm = readResultViewModel(ref);

    return HookConsumer(
      builder: (_, ref, __) {
        Widget? loadingWidget;
        final state = useResultState(ref);

        if (state.isLoading) {
          loadingWidget = const Center(child: CircularProgressIndicator());
        }

        return ScaffoldWidget(
          appBar: AppBar(
            title: const Text('Kalshi logo here'),
          ),
          body: loadingWidget ?? const Text('result page opened'),
        );
      },
    );
  }
}
