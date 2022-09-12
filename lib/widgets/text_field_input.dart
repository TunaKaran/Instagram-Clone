import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textController;
  final bool isPass;
  final String hintText;
  final TextInputType inputType;
  const TextFieldInput(
      {Key? key,
      required this.textController,
      required this.isPass,
      required this.hintText,
      required this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));

    return TextField(
      controller: textController,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: inputType,
      obscureText: isPass,
    );
  }
}
