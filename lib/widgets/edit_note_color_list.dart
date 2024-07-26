import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';

import '../constant.dart';
import 'color_list_view.dart';

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key, required this.note, });
  final NoteModel note;
  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 23.0 * 2,
        child: ListView.builder(

          itemCount: kColors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child:GestureDetector(
                onTap: (){
                  currentIndex = index;
                  widget.note.color = kColors[index].value;
                  setState(() {});
                },
                child:  ColorItem(
                  isActive: currentIndex == index, color: kColors[index],
                ),
              ),
            );
          },
        ),
    );
  }
}
