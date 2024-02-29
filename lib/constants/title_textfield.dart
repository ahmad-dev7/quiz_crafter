import 'package:flutter/material.dart';

class TitleTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const TitleTextField({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.3,
      child: TextField(
        textCapitalization: TextCapitalization.words,
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white12)),
          hintText: label,
          filled: true,
          fillColor: Colors.grey.shade900,
          hintStyle: const TextStyle(color: Colors.white30),
        ),
      ),
    );
  }
}
