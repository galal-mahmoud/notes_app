import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:flutter/material.dart';
import 'add_note_states.dart';



class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit(initialState) : super(InitialAddNoteState());
  Color color = const Color(0xff641628);
  addNote(NoteModel note) async {
    note.color = color.value;
    emit(LoadingAddNoteState());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(
        SuccessAddNoteState(),
      );
    } catch (e) {
      emit(
        FailureAddNoteState(errorMessage: e.toString()),
      );
    }
  }
}
