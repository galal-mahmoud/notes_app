import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/cubits/notes_cubits/notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubits/notes_cubit_states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/home_view.dart';

import 'constant.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => NotesCubit(NotesInitial()),
        child: MaterialApp(
          routes: {
            HomeView.id: (context) => const HomeView(),
          },
            theme: ThemeData(
              brightness: Brightness.dark,
              fontFamily: 'Poppins',
            ),
            debugShowCheckedModeBanner: false,
            home: const HomeView(),
          ),
    );
  }
}
