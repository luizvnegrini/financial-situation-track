import 'package:flutter/material.dart';

import '../../design_system.dart';

class EncryptionDisclaimer extends StatelessWidget {
  const EncryptionDisclaimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const Text(
          '''Your financial information is encrypted and secure. We'll never share or sell any of your personal data.''',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: Color.fromRGBO(112, 135, 151, 1),
          ),
        ),
      ],
    );
  }
}
