import 'package:flutter/material.dart';
import 'package:quiz_crafter/constants/my_text.dart';

class MoveToButton extends StatelessWidget {
  final bool visibility;
  final String label;
  final IconData icon;
  final Color color;
  final Function() onTap;
  const MoveToButton({
    super.key,
    required this.visibility,
    required this.onTap,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibility,
      child: InkWell(
        onTap: onTap,
        child: Chip(
          backgroundColor: color,
          avatar: Visibility(
            visible: label == 'Previous',
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          label: MyText(label),
          labelPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          deleteIcon: Visibility(
            visible: label == 'Next',
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          onDeleted: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
