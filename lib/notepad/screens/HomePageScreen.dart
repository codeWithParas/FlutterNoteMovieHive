

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/NoteModel.dart';
import '../repository/DatabaseHelper.dart';
import 'EnterNoteDetailScreen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  DatabaseHelper dbHelper = DatabaseHelper();

  List<Note> noteList = [
    /*Note("Title 1", "Description 1", ""),
    Note("Title 2", "Description 1", ""),*/
  ];

  @override
  Widget build(BuildContext context) {
    if(noteList.isEmpty) {
      updateNoteListData();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {

        // Adding a new note
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EnterNoteDetailScreen(Note("", "", ""), "Enter New Note")));
      },
      child: const Icon(Icons.add),),
      body: ListView.builder(
          itemCount: noteList.length,
          itemBuilder: (BuildContext context, int position) {
            return Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.purple,
                    ),
                    title: Text(noteList[position].title),
                    subtitle: Text(noteList[position].description),
                    trailing: GestureDetector(
                      child: const Icon(Icons.delete),
                      onTap: (){
                        // delete note from db
                        deleteNote(noteList[position]);
                      },
                    ),
                    onTap: (){

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Item Selected ${position+1}"))
                      );

                      var note = noteList[position];

                      // Update your note
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EnterNoteDetailScreen(note, "Update ${noteList[position].title}")));
                    },
                  ),
                )
            );
          }
      ),
    );
  }

  void updateNoteListData() {
    Future<List<Note>> noteListFuture = dbHelper.getNoteList();
    noteListFuture.then((noteListData) {
      if(noteListData.isNotEmpty) {
        // UpdateUI
        setState(() {
          noteList = noteListData;
        });
      }
    });
  }


  void deleteNote(Note note) async {

    int? result = await dbHelper.deleteNote(note.id);
    if(result != 0) {
      _showAlertDialog('STATUS', '${note.title} Note Deleted Successfully');
      updateNoteListData();
    } else {
      _showAlertDialog('STATUS', 'Problem Deleting Note');
    }
  }

  void _showAlertDialog(String title, String msg) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(msg),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

}
