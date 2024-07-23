import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/notes_cubits/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.note,
  });
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditView(
              note: note,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsetsDirectional.only(
          start: 24.0,
          end: 8.0,
          top: 16.0,
          bottom: 24.0,
        ),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 26.0,
                ),
              ),
              contentPadding: const EdgeInsetsDirectional.all(0),
              subtitle: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: 16.0,
                    bottom: 16.0,
                  ),
                  child: Text(
                    note.subTitle,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.black45,
                    ),
                  )),
              trailing: Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 24.0),
                  child: IconButton(
                    onPressed: () {
                      note.delete();
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    },
                    icon: const Icon(
                      FontAwesomeIcons.trash,
                      color: Colors.black,
                      size: 22.0,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 16),
              child: Text(
                note.date,
                style: const TextStyle(
                  color: Colors.black45,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
