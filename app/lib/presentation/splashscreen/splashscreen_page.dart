import 'package:design_system/design_system.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends HookConsumerWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldWidget(
      backgroundColor: Colors.white,
      showAppBar: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              package: 'design_system',
            ),
            const VGap.sm(),
            const Text(
              'Disocover your financial situation now',
              style: TextStyle(
                fontFamily: 'Rubik',
                package: 'design_system',
                fontSize: 16,
              ),
            ),
            const VGap.xxs(),
            const CircularProgressIndicator(
              color: Color.fromRGBO(0, 28, 149, 1),
            ),
          ],
        ),
      ),
    );
  }
}
