import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_appBar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditView extends StatelessWidget {
  const EditView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
        children: [
          SizedBox(height: 50,),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
          ),
          SizedBox(height: 50.0,),
          CustomTextFormField(hint: 'Title'),
          SizedBox(height: 24.0,),
          CustomTextFormField(hint: 'Content', maxLines: 5,)
        ],
      )),
    );
  }
}
