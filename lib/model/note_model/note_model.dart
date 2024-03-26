import 'package:flutter/cupertino.dart';

class Note{

   int _id = 0;
   String _title = '';
   String _description = '';
   String _date = '';
   int _priority = 0;

  //  call the constructor

  Note(this._id, this._title, this._date, this._priority, this._description,);

   Note.withId(this._id, this._title, this._date, this._priority, this._description,);

   // get the id and other things
   int get id => _id;

   String get title => _title;

   String get description => _description;

   int get priority => _priority;

   String get date => _date;


//    set the id and other things

    set title(String newTitle){
      if(newTitle.length <=255){
        this._title = newTitle;
      }
    }


   set description(String newDescription){
    if(newDescription.length <=255){
      this._description = newDescription;
    }
   }


     set priority(int newPriority){
      if(newPriority >=1 && newPriority <=2)
      {
       this._priority = newPriority;
      }

  }


     set data(String newDate){
      this._date = newDate;

     }


//    Convert a Note Object into a Map Object

     Map<String, dynamic> toMap(){

      var map = Map<String, dynamic>();

      if(id !=null){
        map['id'] = _id;
      }

      map['id'] = _id;
      map['title'] = _title;
      map['description'] = _description;
      map['priority'] = _priority;
      map['date'] = _date;


      return toMap();


     }


     Note.fromMapObject(Map<String, dynamic> map){

      this._id = map['id'];
      this._title = map['title'];
      this._description = map['description'];
      this._priority = map['priority'];
      this._date = map['date'];

     }






}