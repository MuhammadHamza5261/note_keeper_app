import 'package:flutter/material.dart';
import 'package:note_keeper_app/screens/note_detail.dart';
class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {

  int count = 0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> NoteDetailScreen()));
        },
        tooltip: 'Add note',
        child: const Icon(Icons.add,color: Colors.white,),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: const Text('Notes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
        child: Column(
          children: [
            SizedBox(
              height: height*0.5,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: count,
                  itemBuilder: (context,i){
                   return  Card(
                     color: Colors.white,
                     elevation: 2.0,
                     child: ListTile(
                       leading: const CircleAvatar(
                         backgroundColor: Colors.yellow,
                         child: Icon(Icons.keyboard_arrow_right),
                       ),
                       title: const Text('Dummy Title',),
                       subtitle: const Text('Dummy Date'),
                       trailing: const Icon(Icons.delete,color: Colors.grey,),
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=> NoteDetailScreen()));
                         debugPrint('List Tile Tapped');
                       },

                     ),
                   );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
