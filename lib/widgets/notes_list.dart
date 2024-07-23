import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubits/notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubits/notes_cubit_states.dart';

import '../models/note_model.dart';
import 'note_item.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
        builder: (context, state){
          List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes ?? [];
          return Padding(
            padding: const EdgeInsetsDirectional.only(top: 8.0),
            child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 8.0),
                  child: NoteItem(
                    note: notes[index],
                  ),
                );
              },
            ),
          );
        }
    );
  }
}
