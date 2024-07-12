import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.hint, this.maxLines = 1
  });
  final String hint;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
          hintStyle: const TextStyle(
            color: kPrimaryColor
          ),
          enabledBorder: buildBorder(color: Colors.white),
          focusedBorder: buildBorder(color: kPrimaryColor)
      ),
    );
  }

  OutlineInputBorder buildBorder({required Color color}) {
    return  OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: color,
            )
        );
  }
}
