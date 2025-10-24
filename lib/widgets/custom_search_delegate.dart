import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';

class CustomSearchDelegate extends SearchDelegate {
  // Sample data
  CustomSearchDelegate({
    //required this.noteModel,
    required this.searchNote, required List<NoteModel> searchNotes,});

  final List<String> searchNote;
  //final NoteModel noteModel;

  // Clear button (right side of search bar)
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = ""; // clear the text
        },
      ),
    ];
  }

  // Back button (left side of search bar)
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // close search
      },
    );
  }

  // Show results when user submits search
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchNote) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matchQuery[index]),
          onTap: (){
            close(context, matchQuery[index]);
          },
        );
      },
    );
  }

  // Show suggestions as user types
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchNote) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

    return ListView.builder(
      itemCount: searchNote.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matchQuery[index]),
          onTap: () {
            query = matchQuery[index];
            showResults(context); // show result immediately
            close(context, matchQuery[index]);
          },
        );
      },
    );
  }
}