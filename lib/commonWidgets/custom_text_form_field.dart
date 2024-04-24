import 'package:flutter/material.dart';
import 'package:login_page/commonWidgets/utils.dart';

class CustomTextFormField extends StatefulWidget {
  final String? labelText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustomTextFormField({
    super.key,
    this.labelText,
    this.validator,
    this.obscureText = false,
    this.controller
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final key = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: widget.controller,
      onChanged: (e) {
        key.currentState!.validate();
      },
      validator: widget.validator,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: textFieldBorder(),
        focusedBorder: focusedTextFieldBorder(),
        floatingLabelStyle: const TextStyle(color: Colors.purple)
      ),
    );
  }
}
