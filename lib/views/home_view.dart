import 'package:flutter/material.dart';
import 'package:notes_app/widgets/home_view_body.dart';

import '../widgets/add_note_model_sheet.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeViewBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyanAccent,
        shape: const CircleBorder(),
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context){
            return const AddNoteModelShett();
          });
        },
        child: const Icon(
            Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}

