import 'package:flutter/material.dart';

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
    return Center(
      child: Visibility(
        visible: visibility,
        replacement: const SizedBox(
          height: 50,
          width: 80,
        ),
        child: InkWell(
          radius: 50,
          borderRadius: BorderRadius.circular(15),
          onTap: onTap,
          child: Container(
            height: 56,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
            alignment: Alignment.center,
            child: Icon(icon, color: Colors.white, size: 30),
          ),
        ),
      ),
    );
  }
}
