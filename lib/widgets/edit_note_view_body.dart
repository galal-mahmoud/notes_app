import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
import 'package:notes_app/widgets/custom_appBar.dart';
import 'package:notes_app/widgets/edit_note_colors_list.dart';
import 'custom_editing_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
      child: Column(
        children: [
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check_sharp,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = content ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 50),
          CustomEditingTextField(
            onChanged: (value) {
              title = value;
            },
            controller: TextEditingController(text: widget.note.title),
          ),
          const SizedBox(height: 16),
          CustomEditingTextField(
            maxLines: 5,
            onChanged: (value) {
              content = value;
            },
            controller: TextEditingController(text: widget.note.subTitle),
          ),
          SizedBox(height: 16,),
          EditNoteColorsList(note: widget.note,),
        ],
      ),
    );
  }
}
