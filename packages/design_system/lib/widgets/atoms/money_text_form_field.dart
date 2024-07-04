import 'package:design_system/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MoneyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final bool autofocus;

  const MoneyTextFormField({
    super.key,
    required this.controller,
    this.autofocus = false,
    this.validator,
  });

  final _textStyle = const TextStyle(
    color: Color.fromRGBO(77, 100, 117, 1),
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  final _defaultBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromRGBO(233, 238, 242, 1),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextFormField(
        autofocus: autofocus,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.number,
        controller: controller,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          CurrencyInputFormatter(),
        ],
        validator: validator,
        style: _textStyle,
        decoration: InputDecoration(
          focusedBorder: _defaultBorder,
          enabledBorder: _defaultBorder,
          hintStyle: _textStyle,
          hintText: '00,00',
          prefixIcon: Image.asset(
            'assets/images/dollar-sign.png',
            package: 'design_system',
          ),
        ),
      ),
    );
  }
}
