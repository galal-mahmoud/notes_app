import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_note_form.dart';

class AddNoteModelShett extends StatelessWidget {
  const AddNoteModelShett({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
          child: AddNoteForm(),
      ),
    );
  }
}


