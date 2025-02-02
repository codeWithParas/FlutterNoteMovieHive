


import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/NoteModel.dart';

class DatabaseHelper {

  // Singleton type object
  static DatabaseHelper? _databaseHelper = null;
  static Database? _database;

  // Column Name
  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colDate = 'date';

  // Use Named Constructor to create instance of DatabaseHelper
  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if(_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }

    return _databaseHelper ?? DatabaseHelper._createInstance();
  }

  Future<Database?> get database async {
    if(_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Path to your local storage
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'note.db';

    var noteDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return noteDatabase;
  }

  void _createDb(Database db, int newVersion) async {

    await db.execute(
      'CREATE TABLE $noteTable('
          '$colId INTEGER PRIMARY KEY AUTOINCREMENT,'
          '$colTitle TEXT,'
          '$colDescription TEXT,'
          '$colDate TEXT'
          ')'
    );
  }

  // Insert Note data into db
  Future<int?> insertNote(Note note) async {
    var db = await this.database;
    // Convert model object to map object
    var mapObject = note.objectToMapConversion();
    int? result = await db?.insert(noteTable, mapObject);
    return result ?? 0;
  }

  //Delete Note
  Future<int?> deleteNote(int? id) async {
    var db = await this.database;
    int? result = await db?.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
    return result;
  }

  // Fetch all the notes object(map) from database
  // Future -> List : Map (k, V)
  Future<List<Map<String, dynamic>>?> getNoteMapList() async {
    var db = await this.database;
    var result = await db?.query(noteTable);
    return result;
  }

  // List<Map<String, dynamic>> -> List<Note>
  Future<List<Note>> getNoteList() async {
    var noteMapList = await getNoteMapList();
    var count = noteMapList?.length ?? 0;

    List<Note> noteList = [];

    for(int i = 0; i < count; i++){
      var mapObj = noteMapList![i];
      var noteObject = Note.mapToObjectConversion(mapObj);
      noteList.add(noteObject);
    }
    return noteList;
  }

}