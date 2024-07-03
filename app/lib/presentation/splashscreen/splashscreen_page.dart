import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends HookConsumerWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Splashscreen page'),
        ),
      ),
    );
  }
}
