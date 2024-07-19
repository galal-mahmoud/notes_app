import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/models/note_model.dart';

import 'add_note_states.dart';

class AddNoteCubit extends Cubit<AddNoteStates>{
  AddNoteCubit() : super(InitialAddNoteState());
  addNote(NoteModel note)async{
    emit(LoadingAddNoteState(),);
    try{
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(SuccessAddNoteState(),);
    }catch (e){
      emit(FailureAddNoteState(errorMessage: e.toString(),),);
    }
  }

}