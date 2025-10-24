import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/home_view_body.dart';

import '../widgets/custom_floating_action_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, this.note});

  final NoteModel? note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: const CustomFloatingActionButton(),
      body: const HomeViewBody(),
    );
  }
}

