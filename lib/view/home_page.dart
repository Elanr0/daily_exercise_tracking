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
    title: "Morning Walk ", 
    content: "", 
    createdAt: DateTime.now(), 
    updatedAt: DateTime.now(), 
    doingAt: DateTime(2025, 12, 18, 7, 0));

  NoteModel note2 = NoteModel(
    title: "Respond To Emails", 
    content: "", 
    createdAt: DateTime(23), 
    updatedAt: DateTime(20), 
    doingAt: DateTime(2025, 12, 18, 8, 0));

  NoteModel note3 = NoteModel(
    title: "Project Sync", 
    content: "", 
    createdAt: DateTime(20), 
    updatedAt: DateTime(23), 
    doingAt: DateTime(2025, 12, 18, 9, 0));

  List<NoteModel> notes = [];
  notes.addAll([note1, note2, note3]);

     NoteModel afternoon1 = NoteModel(
      title: "Lunch with Team",
      content: "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      doingAt: DateTime(2025, 12, 18, 12, 30),
    );

    NoteModel afternoon2 = NoteModel(
      title: "Design Session",
      content: "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      doingAt: DateTime(2025, 12, 18, 14, 0),
    );

     List<NoteModel> afternoonNotes = [];
  afternoonNotes.addAll([afternoon1, afternoon2]);

  String dateText = 
  "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
          const Text('Daily Exercise Tracking'),
         Text(
          dateText,
         style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700)
          ),
       IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
    ],
  ),
),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, 
        floatingActionButton: FloatingActionButton( 
          onPressed: () {},
          child: const Icon(Icons.add), 
),
body: ListView(
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
            color: Colors.blue[50],
            child: ListTile(
            leading: index == 2 ?
                 const Icon(Icons.groups, color: Colors.green):
                 notes.indexOf(note) % 2 == 0 ?
                     const Icon(Icons.directions_walk, color: Colors.pink):
                     const Icon(Icons.mail_lock_rounded, color: Colors.blue),
            title: Text(note.title),
            subtitle: Text(note.content),
            trailing: Text(
              _formatTime(note.doingAt), style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
      Card(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.all(16),
            child: Text("Afternoon",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
              ),
             ),
            ),
            ...afternoonNotes.map((note) {
              final index = afternoonNotes.indexOf(note);
              return Card(
                margin: const EdgeInsets.symmetric( horizontal: 12, vertical: 6),
                color: Colors.blue[50],
                child: ListTile(
                  leading: index == 0 ?
                  const Icon(Icons.restaurant, color: Colors.deepPurpleAccent ,):
                  const Icon(Icons.design_services, color: Colors.red),
                  title: Text(note.title),
                  subtitle: Text(note.content),
                  trailing: Text(
                    _formatTime(note.doingAt),style: const TextStyle(fontWeight: FontWeight.w700),),
                   ),
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
  String _formatTime(DateTime dt) {
    final h =dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return "$h:m";

  }
} 