import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';
import 'package:notes_app/models/note_model.dart';
import 'color_list_view.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
        autovalidateMode: autovalidateMode,
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 32.0,
            ),
            CustomTextFormField(
              onSaved: (value) {
                title = value;
              },
              hint: 'Title',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              onSaved: (value) {
                subTitle = value;
              },
              hint: 'Content',
              maxLines: 5,
            ),
            const SizedBox(height: 10,),
            const ColorListView(),
            const SizedBox(height: 10,),
            BlocBuilder<AddNoteCubit, AddNoteStates>(
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is LoadingAddNoteState ? true : false,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var currentData = DateTime.now();
                      var currentDataFormated =
                          DateFormat.yMMMMd('en_US').format(currentData);
                      var noteModel = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: currentDataFormated,
                        color: Colors.blue.value,
                      );
                      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ));
  }
}

