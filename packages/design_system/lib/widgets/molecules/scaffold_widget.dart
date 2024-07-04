import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';

import '../../design_system.dart';

class ScaffoldWidget extends StatelessWidget {
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final bool showAppBar;

  const ScaffoldWidget({
    this.body,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.showAppBar = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: backgroundColor,
        appBar: showAppBar
            ? AppBar(
                centerTitle: true,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                title: SvgPicture.asset(
                  'assets/images/logo.svg',
                  package: 'design_system',
                ),
              )
            : null,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kSpacingXXXS),
            child: body,
          ),
        ),
        bottomNavigationBar: bottomNavigationBar,
      );
}
