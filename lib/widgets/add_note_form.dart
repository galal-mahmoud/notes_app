import 'package:flutter/cupertino.dart';

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
    return  Form(
        autovalidateMode: autovalidateMode,
        key: formKey,
        child:  Column(
          children: [
            const SizedBox(
              height: 32.0,
            ),
            CustomTextFormField(
              onSaved: (value){
                title = value;
              },
              hint: 'Title',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              onSaved: (value){
                subTitle = value;
              },
              hint: 'Content',
              maxLines: 5,
            ),
            const SizedBox(
              height: 64.0,
            ),
            CustomButton(
              onTap: (){
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();
                }else{
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {

                  });
                }
              },
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ));
  }
}

