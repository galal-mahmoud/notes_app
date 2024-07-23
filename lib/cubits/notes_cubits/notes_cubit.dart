import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubits/notes_cubit_states.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../constant.dart';
import '../../models/note_model.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit(initialStates) : super(NotesInitial());

  List<NoteModel>? notes;
  fetchAllNotes() {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      notes = notesBox.values.toList();
      emit(NotesSuccess());
  }
}
