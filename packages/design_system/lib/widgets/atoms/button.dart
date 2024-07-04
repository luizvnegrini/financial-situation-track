import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final bool enabled;
  final Widget child;

  const Button({
    required this.onPressed,
    required this.enabled,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.grey;
              }
              return const Color.fromRGBO(0, 28, 149, 1);
            },
          ),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          textStyle: const WidgetStatePropertyAll<TextStyle>(
            TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
