import 'package:flutter/material.dart';

import '../../design_system.dart';

class EncryptionDisclaimer extends StatelessWidget {
  const EncryptionDisclaimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacingNano),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              'assets/images/lock.png',
              package: 'design_system',
              height: 24,
            ),
          ),
          const VGap.xxxs(),
          Text(
            '''Your financial information is encrypted and secure. We'll never share or sell any of your personal data.''',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Work Sans',
              package: 'design_system',
              fontSize: 12,
              color: context.colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
