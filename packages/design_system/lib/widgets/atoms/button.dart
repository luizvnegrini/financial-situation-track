import 'package:flutter/material.dart';

import '../../design_system.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final bool enabled;
  final String label;
  final ButtonStyle buttonStyle;

  Button({
    required this.onPressed,
    required this.enabled,
    required this.label,
    super.key,
  }) : buttonStyle = ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.grey;
              }
              return const Color.fromRGBO(0, 28, 149, 1);
            },
          ),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        );

  Button.light({
    required this.onPressed,
    required this.enabled,
    required this.label,
    super.key,
  }) : buttonStyle = ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.blueGrey;
              }
              return Colors.white;
            },
          ),
          elevation: const WidgetStatePropertyAll(0),
          foregroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.white;
              }
              return const Color.fromRGBO(0, 28, 149, 1);
            },
          ),
          side: const WidgetStatePropertyAll(
            BorderSide(
              color: Color.fromRGBO(0, 28, 149, 1),
              width: 2,
            ),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: buttonStyle,
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Work Sans',
            package: 'design_system',
            fontSize: kSpacingXXXS,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
