import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/models/activity_model.dart';

class ActivityDetailsPage extends StatelessWidget {
  final ActivityModel note;

  const ActivityDetailsPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF0),
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: const Text("Activity Details"),
        actions: [TextButton(onPressed: () {}, child: const Text("Edit"))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(18)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(note.title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: Colors.yellow[100], borderRadius: BorderRadius.circular(18)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.red),
                      SizedBox(width: 10),
                      Text(note.startedAt.toString(), style: TextStyle(fontWeight: FontWeight.w700)),
                      Spacer(),
                      Text("1h 30m", style: TextStyle(fontWeight: FontWeight.w700)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: Colors.green[100], borderRadius: BorderRadius.circular(16)),
              child: Text(note.content, style: TextStyle(height: 2.0, fontWeight: FontWeight.w700)),
            ),
            note.notes == null
                ? const SizedBox.shrink()
                : Column(
                    children: [
                      const Text("Notes", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 8),
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
                        color: Colors.deepPurple[100],
                        elevation: 0,
                        child: Text(note.notes!, style: TextStyle(height: 2.0, fontWeight: FontWeight.w700)),
                      ),
                    ],
                  ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.delete_outline),
                label: const Text("Delete Activity"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[50],
                  foregroundColor: Colors.red,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
