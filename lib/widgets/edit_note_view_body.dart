import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubits/notes_cubit.dart';
import 'package:notes_app/widgets/edit_note_color_list.dart';

import '../models/note_model.dart';
import 'custom_appBar.dart';
import 'custom_text_field.dart';
import 'package:flutter/material.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  @override
  Widget build(BuildContext context) {
    String? title, content;
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CustomAppBar(
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = content ?? widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
              title: 'Edit Note',
              icon: Icons.check,
            ),
            const SizedBox(
              height: 50.0,
            ),
            CustomTextFormField(
              onChange: (value) {
                title = value;
              },
              hint: widget.note.title,
            ),
            const SizedBox(
              height: 24.0,
            ),
            CustomTextFormField(
              onChange: (value) {
                content = value;
              },
              hint: widget.note.subTitle,
              maxLines: 5,
            ),
            const SizedBox(
              height: 16.0,
            ),
            EditNoteColorList(
              note: widget.note,
            ),
          ],
        ),
      ),
    );
  }
}
