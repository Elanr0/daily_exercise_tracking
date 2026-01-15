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

final List<ActivityModel> activities =[];

@override
Widget build(BuildContext context) {

final dateText ="${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('My Activities'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
        child: Center(
          child: Text(dateText,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
        ),
      ),
    )    
  ],
),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async { 
          final result = await 
          Navigator.push(context, MaterialPageRoute(builder: (_) => const AddNewActivity()),
          );
          if (result == null) return;
          setState((){
            activities.add(result as ActivityModel);
          });
        },
        child: const Icon(Icons.add),
      ),
      body: activities.isEmpty 
      ? const Center(child: Text("no activity yet")) 
      : ListView.builder(itemCount: activities.length,
      itemBuilder: (context, index) {
        final activity = activities[index];

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          color: Colors.blueGrey[50],
          child: ListTile(
            leading: Icon(
              _categoryIcon(activity.category),
            ),
            title: Text(activity.title),
            subtitle: Text(activity.content),
            trailing: Text(_formatTime(activity.startedAt),
            style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ActivityDetailsPage(note: activity),
              ),
              );
            },
          ),
        );
      },
      )
    );
  }

  String _formatTime(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return "$h:$m";
  }

  IconData _categoryIcon(String category) {
    switch(category) {
      case "fitness":
      return Icons.directions_run_outlined;
      case "work":
      return Icons.business_center_rounded;
      case "study": 
      return Icons.import_contacts_sharp;
      case "shopping": 
      return Icons.shopping_cart;
      case "personal":
      return Icons.person;
      case "health":
      return Icons.health_and_safety;
      case "home":
      return Icons.home;
      case "finance":
      return Icons.credit_card;
      case "hobby":
      return Icons.headphones_rounded;
      default:
      return Icons.abc;
    }
  }
}
