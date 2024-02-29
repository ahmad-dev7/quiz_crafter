import 'package:flutter/material.dart';

class QuestionTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const QuestionTextField(
      {super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      controller: controller,
      style: const TextStyle(color: Colors.white),
      maxLines: 2,
      decoration: InputDecoration(
        hintText: label,
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white30)),
        hintStyle: const TextStyle(color: Colors.white30),
        filled: true,
        fillColor: const Color(0x2F000000),
      ),
    );
  }
}
