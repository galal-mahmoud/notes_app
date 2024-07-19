import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';

import 'add_note_form.dart';

class AddNoteModelShett extends StatelessWidget {
  const AddNoteModelShett({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16.0),
      child: BlocConsumer<AddNoteCubit, AddNoteStates>(
            listener: (context, state) {
              if(state is FailureAddNoteState){
                debugPrint('Failied ${state.errorMessage}');
              }
              else if(state is SuccessAddNoteState){
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: state is LoadingAddNoteState ? true : false,
                child: const SingleChildScrollView(
                  child: AddNoteForm(),
                ),
              );
            }),
    );
  }
}
