import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubits/notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubits/notes_cubit_states.dart';
import 'package:notes_app/widgets/home_view_body.dart';

import '../widgets/add_note_model_sheet.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(NotesInitial),
        child: Scaffold(
      body: const HomeViewBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyanAccent,
        shape: const CircleBorder(),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
              context: context, builder: (context){
            return const AddNoteModelShett();
          });
        },
        child: const Icon(
            Icons.add,
          color: Colors.black,
        ),
      ),
    ));
  }
}

