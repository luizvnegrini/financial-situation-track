import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';

import '../../design_system.dart';

class ScaffoldWidget extends StatelessWidget {
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;

  const ScaffoldWidget({
    this.body,
    this.bottomNavigationBar,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: SvgPicture.asset(
            'assets/images/logo.svg',
            package: 'design_system',
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kSpacingXXXS),
            child: body,
          ),
        ),
        bottomNavigationBar: bottomNavigationBar,
      );
}
