import 'package:flutter/material.dart';

/// Customized Text
class MyText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final TextAlign? textAlign;
  const MyText(
    this.text, {
    super.key,
    this.size,
    this.weight,
    this.color,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        overflow: TextOverflow.visible,
        color: color ?? Colors.white,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
