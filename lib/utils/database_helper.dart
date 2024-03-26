import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import '../model/note_model/note_model.dart';



// class DatabaseHelper{
//
//   DatabaseHelper._privateConstructor();
//
//    static  final _instance = DatabaseHelper._privateConstructor();
//
//    static DatabaseHelper instance = _instance;
//
//   factory DatabaseHelper(){
//
//     if(_instance == null){
//       _instance = DatabaseHelper._privateConstructor();
//     }
//
//
//
//
//
//      return _instance;
//
//   }
//
//
//
// }
class DatabaseHelper{

  static DatabaseHelper?  _databaseHelper;
  static Database? _database;

  String noteTable  = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String priority = 'priority';
  String colDate = 'date';

  DatabaseHelper._createInstance();

  factory DatabaseHelper(){

    if(_databaseHelper == null){

      _databaseHelper  = DatabaseHelper._createInstance();
    }
    return _databaseHelper!;

  }

  Future<Database> get database async {
    if(_database == null){
      _database = await initializeDatabase();
    }
    return _database!;

  }


  Future<Database> initializeDatabase() async{

    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';
    
   var notesDatabase = openDatabase(path, version: 1, onCreate: _createDb);
   return notesDatabase;

  }


   void _createDb(Database db, int newVersion) async{

    await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT ,)'
        '$colDescription TEXT, $priority INTEGER, $colDate TEXT'

    );
   }

//    fetch operation

 Future<List<Map<String, dynamic>>>getNoteMapList() async{

    Database db = await this.database;
    // var  result  = await db.rawQuery('SELECT * FROM $noteTable order by $priority ASC');
    var  result  = await db.query(noteTable, orderBy: '$priority ASC');
    return result;

}

// Insert Operation
  Future<int> insertNote(Note note) async{
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

  //Update Operation
  Future<int> updateNote(Note note) async {
    Database db = await this.database;
    var result = await db.update(noteTable,
      note.toMap(),
      where: '$colId = ?',
      whereArgs: [note.id],
    );
    return result;
  }






}