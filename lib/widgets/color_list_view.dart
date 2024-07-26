import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

import '../constant.dart';


class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive ?  CircleAvatar(
      radius: 23.0,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        backgroundColor: color,
        radius: 20.0,
      ),
    ) :   CircleAvatar(
        backgroundColor: color,
        radius: 20.0,
    );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
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
                  BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
                  setState(() {});
                  },
                  child:  ColorItem(
                      isActive: currentIndex == index, color: kColors[index],
                  ),
              ),
          );
        },
    ));
  }
}

