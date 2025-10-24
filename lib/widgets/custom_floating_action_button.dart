import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

import 'add_note_bottom_sheet.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return AddNoteBottomSheet();
          },
        );
      },
      shape: CircleBorder(),
      backgroundColor: kPrimaryColor,
      child: Icon(Icons.add, color: Colors.black, size: 36),
    );
  }
}

