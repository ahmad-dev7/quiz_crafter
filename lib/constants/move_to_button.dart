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
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Container(
          height: 40,
          width: 200,
          alignment: Alignment.center,
          child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            tileColor: color.withOpacity(0.3),
            dense: true,
            visualDensity: const VisualDensity(vertical: -4),
            title: Center(child: MyText('$label       ')),
            minVerticalPadding: 0,
            leading: Visibility(
                child: Icon(
              icon,
              size: 20,
              color: label == 'Next' ? Colors.transparent : Colors.white60,
            )),
            trailing: Visibility(
                child: Icon(
              icon,
              size: 20,
              color: label != 'Next' ? Colors.transparent : Colors.white60,
            )),
          ),
        ),
      ),
    );

    // Visibility(
    //   visible: visibility,
    //   child: InkWell(
    //     onTap: onTap,
    //     child: Chip(
    //       deleteButtonTooltipMessage: '',
    //       backgroundColor: color,
    //       avatar: Visibility(
    //         visible: label == 'Previous',
    //         child: Icon(
    //           icon,
    //           color: Colors.white,
    //         ),
    //       ),
    //       label: SizedBox(width: 100, child: MyText(label)),
    //       labelPadding: const EdgeInsets.fromLTRB(15, 2.5, 15, 2.5),
    //       deleteIcon: Visibility(
    //         visible: label == 'Next',
    //         child: Icon(
    //           icon,
    //           color: Colors.white,
    //         ),
    //       ),
    //       onDeleted: onTap,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //     ),
    //   ),
    // );
  }
}
