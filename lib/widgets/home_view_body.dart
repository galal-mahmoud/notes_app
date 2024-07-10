import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'custom_appBar.dart';
import 'note_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsetsDirectional.symmetric(horizontal: 16.0),
      child: Column(
        children: [
           SizedBox(
            height: 50.0,
          ),
           CustomAppBar(),
          NoteItem(),
        ],
      ),
    );
  }
}


