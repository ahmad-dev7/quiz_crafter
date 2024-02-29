import 'package:flutter/material.dart';
import 'package:quiz_crafter/constants/my_text.dart';

/// Customized Alert Dialog
myDialog(String message, BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        backgroundColor: Colors.grey.shade700,
        content: MyText(
          message,
          color: Colors.white,
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const MyText(
              'Okay',
              color: Colors.white,
            ),
          )
        ],
      );
    },
  );
}
