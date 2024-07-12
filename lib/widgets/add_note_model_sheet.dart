import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class AddNoteModelShett extends StatelessWidget {
  const AddNoteModelShett({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(
            height: 32.0,
          ),
          CustomTextField(
            hint: 'Title',
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextField(
            hint: 'Content',
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}

