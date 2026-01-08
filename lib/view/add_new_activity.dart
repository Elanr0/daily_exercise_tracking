import 'package:flutter/material.dart';

class AddNewActivity extends StatefulWidget {
  const AddNewActivity({super.key});

  @override
  State<AddNewActivity> createState() => _AddNewActivityState();
}

TextEditingController activityNameController = TextEditingController();

class _AddNewActivityState extends State<AddNewActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Aktivite Adı"),
            TextFormField(
              controller: activityNameController,
              decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Aktivite Adı'),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Yeni Aktivite Eklendi: ${activityNameController.text}");
                activityNameController.clear();

                Navigator.pop(context);
              },
              child: const Text('Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
