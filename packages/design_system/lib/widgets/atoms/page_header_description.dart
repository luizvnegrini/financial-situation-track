import 'package:flutter/material.dart';

class PageHeaderDescription extends StatelessWidget {
  final String text;
  final String boldText;

  const PageHeaderDescription({
    required this.text,
    required this.boldText,
    super.key,
  });

  final textColor = const Color.fromRGBO(0, 28, 149, 1);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: text,
          style: TextStyle(
            fontFamily: 'Rubik',
            package: 'design_system',
            color: textColor,
            fontSize: 18,
          ),
          children: <TextSpan>[
            TextSpan(
              text: boldText,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
