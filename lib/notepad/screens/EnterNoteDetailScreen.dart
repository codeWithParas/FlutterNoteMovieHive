

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/NoteModel.dart';
import '../repository/DatabaseHelper.dart';

class EnterNoteDetailScreen extends StatefulWidget {

  Note note;
  String title;

  EnterNoteDetailScreen(this.note, this.title);

  @override
  State<EnterNoteDetailScreen> createState() => _EnterNoteDetailScreenState(note, title);
}

class _EnterNoteDetailScreenState extends State<EnterNoteDetailScreen> {

  DatabaseHelper dbHelper = DatabaseHelper();

  Note note;
  String title;
  _EnterNoteDetailScreenState(this.note, this.title);

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    titleController.text = note.title;
    descriptionController.text = note.description;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: titleController,
                onChanged: (value) {
                  note.title = titleController.text;
                },
                decoration: InputDecoration(
                  labelText: "Note Title",
                  labelStyle: Theme.of(context).textTheme.titleLarge,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: descriptionController,
                  onChanged: (value) {
                    note.description = descriptionController.text;
                  },
                  decoration: InputDecoration(
                      labelText: "Note Description",
                      labelStyle: Theme.of(context).textTheme.titleLarge,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  )
              ),
            ),
            ElevatedButton(onPressed: (){
              saveNote();
            }, child: Text("Save Note")),
            ElevatedButton(onPressed: (){
              //deleteNote();
            }, child: Text("Delete Note"))
          ],
        ),
      ),
    );
  }

  void saveNote() async {

    note.date = DateFormat.yMMMd().format(DateTime.now());
    int? result = await dbHelper.insertNote(note);
    if(result != 0) {
      // Show success msg
      _showAlertDialog('STATUS', '${note.title} Note Saved Successfully');

      // Switch Back entry page
      Navigator.pop(context);
    } else {
      // Failure msg
      _showAlertDialog('STATUS', 'Problem Saving Note');
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
