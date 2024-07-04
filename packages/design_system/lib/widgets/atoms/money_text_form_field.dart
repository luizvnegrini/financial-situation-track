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

  final _textStyle = const TextStyle(
    color: Color.fromRGBO(77, 100, 117, 1),
    fontFamily: 'Rubik',
    package: 'design_system',
    fontSize: 32,
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
        style: _textStyle,
        decoration: InputDecoration(
          focusedBorder: _defaultBorder,
          enabledBorder: _defaultBorder,
          errorBorder: _defaultBorder,
          hintStyle: _textStyle,
          hintText: '00,00',
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
