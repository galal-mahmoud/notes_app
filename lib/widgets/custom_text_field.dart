import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key, required this.hint, this.maxLines = 1, this.onSaved
  });
  final String hint;
  final int maxLines;
  final Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: (data){
        if(data?.isEmpty ?? true){
          return 'field is required';
        }else{
          return null;
        }
      },
      onSaved: onSaved,
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
