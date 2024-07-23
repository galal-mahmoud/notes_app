import 'package:flutter/material.dart';


import '../models/note_model.dart';
import '../widgets/edit_note_view_body.dart';

class EditView extends StatelessWidget {
  const EditView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: EditNoteViewBody(
            note: note,
          ),
      ),
    );
  }
}

