import 'package:flutter/cupertino.dart';

import 'note_item.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 8.0),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsetsDirectional.only(bottom: 8.0),
            child: NoteItem(),
          );
        },
      ),
    );
  }
}
