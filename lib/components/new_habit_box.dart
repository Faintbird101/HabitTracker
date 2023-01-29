import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class NewHabitBox extends StatelessWidget {
  final String hintText;
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const NewHabitBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[700],
      content: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade400),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: onSave,
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.black,
        ),
        const SizedBox(
          width: 10.0,
        ),
        MaterialButton(
          onPressed: onCancel,
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.black,
        )
      ],
    );
  }
}
