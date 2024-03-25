import 'package:flutter/material.dart';
class NoteDetailScreen extends StatefulWidget {
  const NoteDetailScreen({super.key});

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();


  // create a static list

  static final _priorities = [
    'High',
    'Low',
  ];


  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text('Edit Note',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: ListView(
          children: [
            ListTile(
              title: DropdownButton(
                items: _priorities.map((String dropDownStringItem){
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                style: TextStyle(
                  color: Colors.black87

                ),
                value: 'Low',
                onChanged: (value){
                  setState(() {
                    debugPrint('User selected $value');
                  });
                },
              ),
            ),
           Padding(
             padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
             child: TextFormField(
               controller: titleController,
               onChanged: (value){
                 debugPrint('Something changed in Title Text Field');
               },
               decoration: InputDecoration(
                 labelText: 'Title',
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(5.0)
                 ),
               ),

             ),
           ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              child: TextFormField(
                controller: descriptionController,
                onChanged: (value){
                  debugPrint('Something changed in Title Text Field');
                },
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                ),

              ),
            ),
           SizedBox(
             height: 20,
           ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: height*0.065,
                  width: width *0.3,
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      primary: Colors.green,

                    ),


                      onPressed: (){},
                      child: const Text('Save',style: TextStyle(color: Colors.white),),
                  ),
                ),
                SizedBox(
                  height: height*0.065,
                  width: width *0.3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      primary: Colors.green,

                    ),
                    onPressed: (){},
                    child: const Text('Delete',style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
