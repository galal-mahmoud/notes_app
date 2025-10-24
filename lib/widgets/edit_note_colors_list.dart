import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';

import '../constants.dart';
import 'color_item.dart';

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({ super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
 late int currentIndex;

 @override
  void initState() {
   currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: GestureDetector(
              onTap: (){
                currentIndex = index;
                widget.note.color = kColors[index].toARGB32();
                setState(() {

                });
              },
              child: ColorItem(isActive: currentIndex == index, color: kColors[index],),
            ),
          );
        },
      ),
    );
  }
}
