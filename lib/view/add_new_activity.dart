import 'package:flutter/material.dart';

class AddNewActivity extends StatefulWidget {
  const AddNewActivity({super.key});

  @override
  State<AddNewActivity> createState() => _AddNewActivityState();
}

class _AddNewActivityState extends State<AddNewActivity> {
  TextEditingController activityNameController = TextEditingController();

  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Yeni Bir Aktivite Oluştur"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Aktivite Adı"),
            TextFormField(
              controller: activityNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Aktivite Adı',
              ),
            ),

            const SizedBox(height: 20),
            Text("Kategori"),
            const SizedBox(height: 12),
            Wrap(
              direction: Axis.horizontal,
              spacing: 12,
              runSpacing: 12,
              children: [
                _categoryPill("fitness", Icons.directions_run_outlined),
                _categoryPill("work", Icons.business_center_rounded),
                _categoryPill("study", Icons.import_contacts_sharp),
                _categoryPill("shopping", Icons.shopping_cart),
                _categoryPill("personal", Icons.person),
                _categoryPill("health", Icons.health_and_safety),
                _categoryPill("home", Icons.home),
                _categoryPill("finance", Icons.credit_card),
                _categoryPill("hobby", Icons.headphones_rounded),
              ],
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
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

  Widget _categoryPill(String name, IconData icon) {
    final isSelected = selectedCategory == name;

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        setState(() {
          selectedCategory = name;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: isSelected ? 2 : 1,
            color: isSelected ? Colors.black : Colors.grey,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color:  isSelected ? Colors.black : Colors.grey,),
            Text(
              name,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
