import 'package:flutter/material.dart';

class OptionsTextField extends StatefulWidget {
  final TextEditingController firstOptionController;
  final TextEditingController secondOptionController;
  final TextEditingController thirdOptionController;
  final TextEditingController fourthOptionController;
  final bool firstOption;
  final bool secondOption;
  final bool thirdOption;
  final bool fourthOption;
  final Function(int index) onChange;
  const OptionsTextField({
    super.key,
    required this.onChange,
    required this.firstOptionController,
    required this.secondOptionController,
    required this.thirdOptionController,
    required this.fourthOptionController,
    required this.firstOption,
    required this.secondOption,
    required this.thirdOption,
    required this.fourthOption,
  });

  @override
  State<OptionsTextField> createState() => _OptionsTextFieldState();
}

class _OptionsTextFieldState extends State<OptionsTextField> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: SizedBox(
          height: 56 * 6,
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                title: TextField(
                  controller: getController(index),
                  textCapitalization: TextCapitalization.sentences,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Enter options",
                    hintStyle: const TextStyle(color: Colors.white30),
                    prefixText: '${getPrefixString(index)}   ',
                    prefixStyle: const TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    fillColor: Colors.black26,
                    filled: true,
                  ),
                ),
                trailing: Checkbox.adaptive(
                  value: getOptionNumber(index) ?? false,
                  onChanged: (_) {
                    widget.onChange(index);
                    debugPrint(
                      'option at $index is set as : ${getOptionNumber(index)}',
                    );
                  },
                  activeColor: Colors.green,
                  side: const BorderSide(color: Colors.white),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  getController(int index) {
    return switchValue(
      [
        widget.firstOptionController,
        widget.secondOptionController,
        widget.thirdOptionController,
        widget.fourthOptionController
      ],
      index,
    );
  }

  getOptionNumber(int index) {
    return switchValue([
      widget.firstOption,
      widget.secondOption,
      widget.thirdOption,
      widget.fourthOption
    ], index);
  }

  getPrefixString(int index) {
    return switchValue(['A)', 'B)', 'C)', 'D)'], index);
  }

  switchValue(List value, int index) {
    debugPrint('I got called by ${value.first}');

    switch (index + 1) {
      case 1:
        return value[0];
      case 2:
        return value[1];
      case 3:
        return value[2];
      case 4:
        return value[3];
    }
  }
}
