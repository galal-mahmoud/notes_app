import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

import '../helper/functions.dart';

class CustomEditingTextField extends StatelessWidget {
  const CustomEditingTextField({
    super.key,
    this.maxLines = 1,
    this.onChanged, required this.controller,
  });

  final TextEditingController controller;

  final int maxLines;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(kPrimaryColor),
      ),
    );
  }
}
