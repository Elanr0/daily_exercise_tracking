import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/models/note_model.dart';

class ActivityDetailsPage extends StatelessWidget{
  final NoteModel note; 

  const ActivityDetailsPage({
    super.key,   
    required this.note,                             
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Activity Details"),
      ),
      body: Padding(padding: const EdgeInsets.all(16),              
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(note.title,
          style: TextStyle(
            fontSize: 22, 
            fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    ),
         const SizedBox(height: 10),
          Container(              
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Color(0xFFE7F6EF),
              borderRadius: BorderRadius.circular(999),  
              ),
            child: Text("Fitness", 
            style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
       ),
      ),
    );
  }
}