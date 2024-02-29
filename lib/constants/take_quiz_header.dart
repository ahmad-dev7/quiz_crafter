import 'package:flutter/material.dart';
import 'package:quiz_crafter/constants/my_text.dart';

class QuizHeader extends StatelessWidget {
  final Function() onReveal;
  final String info;
  const QuizHeader({super.key, required this.onReveal, required this.info});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onDoubleTap: () => Navigator.pop(context),
          child: MyText(
            info,
            weight: FontWeight.w500,
            size: 16,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xD5FFFFFF),
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
          onPressed: onReveal,
          child: const MyText('Reveal', color: Colors.black),
        )
      ],
    );
  }
}
