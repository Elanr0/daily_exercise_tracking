import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/models/activity_model.dart';
import 'package:flutter_application_1/view/activity_details/activity_details_page.dart';
import 'package:flutter_application_1/view/add_new_activity.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<ActivityModel> activities = [];
    ActivityModel note = ActivityModel(
      title: "Morning Walk ",
      content: "Koşu yapmak için parka git. Hava serin ve güneşli.",
      category: "Fitness",
      startedAt: DateTime.now(),
      finishedAt: DateTime.now(),
    );

    String dateText = "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('My Activities'),
        actions: [Text(dateText, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700))],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const AddNewActivity()));
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: activities.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            color: Colors.blue[50],
            child: ListTile(
              leading: index == 2
                  ? const Icon(Icons.groups, color: Colors.green)
                  : activities.indexOf(note) % 2 == 0
                  ? const Icon(Icons.directions_walk, color: Colors.pink)
                  : const Icon(Icons.mail_lock_rounded, color: Colors.blue),
              title: Text(note.title),
              subtitle: Text(note.content),
              trailing: Text(_formatTime(note.startedAt), style: const TextStyle(fontWeight: FontWeight.w700)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ActivityDetailsPage(note: note)));
              },
            ),
          );
        },
      ),
    );
  }

  String _formatTime(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return "$h:$m";
  }
}
