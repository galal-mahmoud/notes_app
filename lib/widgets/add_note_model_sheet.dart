import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';
import 'package:notes_app/cubits/notes_cubits/notes_cubit.dart';

import 'add_note_form.dart';

class AddNoteModelShett extends StatelessWidget {
  const AddNoteModelShett({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(InitialAddNoteState),
      child: BlocConsumer<AddNoteCubit, AddNoteStates>(
            listener: (context, state) {
              if(state is FailureAddNoteState){
              }
              else if(state is SuccessAddNoteState){
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return   AbsorbPointer(
                absorbing: state is LoadingAddNoteState ? true : false,
                child:  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: 16.0,
                      end: 16.0,
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: const SingleChildScrollView(
                  child: AddNoteForm(),
                )),);
            }),
    );
  }
}
