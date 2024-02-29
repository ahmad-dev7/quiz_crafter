import 'package:flutter/material.dart';
import 'package:quiz_crafter/constants/my_text.dart';

class MyButton extends StatelessWidget {
  final Function() onTap;
  final String label;
  final Color color;
  const MyButton(
      {super.key,
      required this.onTap,
      required this.label,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: MyText(
            label,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
