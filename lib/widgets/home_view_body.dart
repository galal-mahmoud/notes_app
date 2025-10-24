import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/home_view.dart';

import 'custom_appBar.dart';
import 'custom_search_delegate.dart';
import 'notes_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, left: 16, right: 16),
      child: Column(
        children: [
          CustomAppBar(
            title: 'Notes',
            icon: Icons.search,
            onPressed: () async{
              var notes = BlocProvider.of<NotesCubit>(context).notes ?? [];

              final selectedNote = await showSearch(
                context: context,
                delegate: CustomSearchDelegate(
                  searchNotes: notes, searchNote: [],
                ),
              );

              if (selectedNote != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomeView(note: selectedNote),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 16),
          const Expanded(child: NotesListView()),
        ],
      ),
    );
  }

  // Future<dynamic> selectNote(BuildContext context, List<NoteModel> notes) async {
  //    final selectedTitle = await showSearch(
  //     context: context,
  //     delegate: CustomSearchDelegate(
  //       searchNote: notes.map((e) => e.title).toList(),
  //     ),
  //   );
  //   return selectedTitle;
  // }
}
