import 'package:design_system/design_system.dart';
import 'package:design_system/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MoneyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final Function(String?)? onFieldSubmitted;

  const MoneyTextFormField({
    super.key,
    required this.controller,
    this.onFieldSubmitted,
    this.focusNode,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final defaultErrorBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 1.0),
      borderRadius:
          BorderRadius.circular(4.0), // Ajuste o raio conforme necessário
    );
    final defaultBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: context.colors.border,
      ),
    );
    final textStyle = TextStyle(
      color: context.colors.darkGrey,
      fontFamily: 'Rubik',
      package: 'design_system',
      fontSize: 32,
      fontWeight: FontWeight.w500,
    );

    return SizedBox(
      child: TextFormField(
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          CurrencyInputFormatter(),
        ],
        validator: validator,
        style: textStyle,
        decoration: InputDecoration(
          focusedBorder: defaultBorder,
          enabledBorder: defaultBorder,
          focusedErrorBorder: defaultErrorBorder,
          errorBorder: defaultErrorBorder,
          hintStyle: textStyle,
          hintText: '0.00',
          contentPadding: const EdgeInsets.symmetric(vertical: kSpacingQuarck),
          prefixIcon: Image.asset(
            'assets/images/dollar-sign.png',
            package: 'design_system',
          ),
        ),
      ),
    );
  }
}
