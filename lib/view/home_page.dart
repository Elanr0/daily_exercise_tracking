import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/models/note_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override 
  Widget build(BuildContext context) {

  NoteModel note1 = NoteModel(
    title: "Morning Walk ", content: "07:00 - 07:30 ", 
    createdAt: DateTime.now(), 
    updatedAt: DateTime.now(), 
    doingAt: DateTime.now());

  NoteModel note2 = NoteModel(
    title: "Respond To Emails", 
    content: "08:00 - 09:00", 
    createdAt: DateTime(23), 
    updatedAt: DateTime(20), 
    doingAt: DateTime(10));

  NoteModel note3 = NoteModel(
    title: "Project Sync", 
    content: "09:00 - 010:30", 
    createdAt: DateTime(20), 
    updatedAt: DateTime(23), 
    doingAt: DateTime(10));

  List<NoteModel> notes = [];
  notes.addAll([note1, note2, note3]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
          const Text('Daily Exercise Tracking'),
         Text('${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}',
         style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700)
          ),
       IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
    ]
  )
),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, 
        floatingActionButton: FloatingActionButton( 
          onPressed: () {}, 
          child: const Icon(Icons.add), 
),
body: Column(
  children: [
    Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.pink[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
         const Padding(padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
         child: Text(
          "Morning",
         style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900,
      ),
    ),
  ),
        ...notes.map((note) {
          final index = notes.indexOf(note);
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            color: Colors.pink[100],
            child: ListTile(
            leading: index == 2 ?
                 const Icon(Icons.groups, color: Colors.green):
                 notes.indexOf(note) % 2 == 0 ?
                     const Icon(Icons.directions_walk, color: Colors.pink):
                     const Icon(Icons.mail_lock_rounded, color: Colors.blue),
            title: Text(note.title),
            subtitle: Text(note.content),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 