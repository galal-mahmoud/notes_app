class AddNoteStates{}

class InitialAddNoteState extends AddNoteStates{}
class LoadingAddNoteState extends AddNoteStates{}
class SuccessAddNoteState extends AddNoteStates{}
class FailureAddNoteState extends AddNoteStates{
  final String errorMessage;
  FailureAddNoteState({required this.errorMessage});
}
