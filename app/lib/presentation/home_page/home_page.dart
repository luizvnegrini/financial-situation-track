import 'package:design_system/design_system.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';

import 'home_page_providers.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  SizedBox get defaultSpacer => const SizedBox(height: 16);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final vm = readHomeViewModel(ref);

    return HookConsumer(
      builder: (_, ref, __) {
        Widget? loadingWidget;
        final state = useHomeState(ref);

        if (state.isLoading) {
          loadingWidget = const Center(child: CircularProgressIndicator());
        }

        return ScaffoldWidget(
          appBar: AppBar(
            title: const Text('Kalshi logo here'),
          ),
          body: loadingWidget ?? const Text('initial page opened'),
        );
      },
    );
  }
}

class ErrorWidget extends StatelessWidget {
  final VoidCallback onTryAgain;

  const ErrorWidget({super.key, required this.onTryAgain});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onTryAgain,
        child: const Text('Try again'),
      ),
    );
  }
}
