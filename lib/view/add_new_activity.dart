import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/models/activity_model.dart';
import 'package:flutter_application_1/view/activity_details/activity_details_page.dart';

class AddNewActivity extends StatefulWidget {
  const AddNewActivity({super.key});

  @override
  State<AddNewActivity> createState() => _AddNewActivityState();
}

class _AddNewActivityState extends State<AddNewActivity> {
final TextEditingController activityNameController = TextEditingController();
final TextEditingController activityDetailsController = TextEditingController();

String? selectedCategory;

  TimeOfDay? startTime;
  TimeOfDay? endTime;

@override
  void dispose() {
  activityNameController.dispose();
  activityDetailsController.dispose();
    super.dispose();
  }
  
@override
Widget build(BuildContext context) {

  final canAdd = activityNameController.text.trim().isNotEmpty && selectedCategory != null && startTime!= null && endTime!= null;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("New Activity"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            const Text("Activity Name"),
            const SizedBox(height: 8),
          TextFormField(
            controller: activityNameController,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
                labelText: 'Activity Name',
              ),
            ),

            const SizedBox(height: 12),
            const Text("Activity Details"),
            const SizedBox(height: 8),

Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(12),
      side: const BorderSide(color: Colors.grey),
    ),
    child: Padding(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    child: TextFormField(controller: activityDetailsController,
    keyboardType: TextInputType.multiline,
    minLines: 4,
    maxLines: 8,
    decoration: const InputDecoration(
      hintText: "details add",
      border: InputBorder.none,
      ),
    ),
  ),
),

  const SizedBox(height: 20),
  Text("Category"),
  const SizedBox(height: 12),
  Wrap(
    direction: Axis.horizontal,
    spacing: 12,
    runSpacing: 12,
    children: [
      _categoryPill("fitness", Icons.directions_run_outlined, const Color.fromARGB(255, 223, 131, 161)),
      _categoryPill("work", Icons.business_center_rounded, const Color.fromARGB(255, 223, 131, 161)),
      _categoryPill("study", Icons.import_contacts_sharp, const Color.fromARGB(255, 223, 131, 161)),
      _categoryPill("shopping", Icons.shopping_cart, const Color.fromARGB(255, 223, 131, 161)),
      _categoryPill("personal", Icons.person,const Color.fromARGB(255, 223, 131, 161)),
      _categoryPill("health", Icons.health_and_safety, const Color.fromARGB(255, 223, 131, 161)),
      _categoryPill("home", Icons.home, const Color.fromARGB(255, 223, 131, 161)),
      _categoryPill("finance", Icons.credit_card,const Color.fromARGB(255, 223, 131, 161)),
      _categoryPill("hobby", Icons.headphones_rounded, const Color.fromARGB(255, 223, 131, 161)),
    ],
  ),

  const SizedBox(height: 16),
  const Text("Time"),
  const SizedBox(height: 8),

            Row(
              children: [Expanded(child: _timeBox (
                title: "Start",
                value: _formatTime(startTime),
                onTap: _pickStartTime,
                  ),
                ),
                const SizedBox(width: 12),
                  Expanded(child: _timeBox(
                    title: "End",
                    value: _formatTime(endTime),
                    onTap: _pickEndTime,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: canAdd ? () {

                final now = DateTime.now();

                final startDt = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  startTime!.hour,
                  startTime!.minute,
                );
                  
                final endDt = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  endTime!.hour,
                  endTime!.minute,
                );



                final newActivity = ActivityModel(

                title: activityNameController.text.trim(),
                content: activityDetailsController.text.trim(),
                category: selectedCategory!,
                startedAt: startDt,
                finishedAt: endDt,
                );
                Navigator.pop(context, newActivity);
              }: null,
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _timeBox({
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
return InkWell(borderRadius: BorderRadius.circular(16),
onTap: onTap,
child: Container(
  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.grey),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: const TextStyle(fontSize: 16, color: Colors.grey)),
      const SizedBox(height: 6),
      Row(
        children: [
          const Icon(Icons.access_time, size: 18),
          const SizedBox(width: 8),
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ],
          ), 
        ],
      ), 
    ),
  );
}
  
    Future<void> _pickStartTime() async{
      final picked = await showTimePicker(context: context, initialTime: startTime ?? TimeOfDay.now(),
    );
      
      if (picked == null) return;

      setState(() {
        startTime = picked;

        if (endTime != null && _timeToMinutes(endTime !) <=_timeToMinutes(startTime!)) {
          endTime = null;
        }
      }
    );
  }

    Future<void> _pickEndTime() async{
     if (startTime == null){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("choose the start time first")),
      );
      return;
     } 
     final picked = await showTimePicker(context: context, initialTime: endTime ?? startTime!,
     );
     if (picked == null) return;

     final startMin = _timeToMinutes(startTime!);
     final endMin = _timeToMinutes(picked);

     if (endMin <=startMin) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("try again")),
      );
      return;
     }
     setState(() {
       endTime = picked;
     });
    }

    int _timeToMinutes(TimeOfDay t ) => t.hour * 60 + t.minute;

    String _formatTime (TimeOfDay ? t) {
      if (t == null ) return "--:--;";
      final h = t.hour.toString().padLeft(2,'0');
      final m = t.minute.toString().padLeft(2, '0');
      return "$h:$m";
    }
  

  Widget _categoryPill(String name, IconData icon, Color color) {
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
            color: isSelected ? Colors.black : color,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color:  isSelected ? Colors.black : color,),
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
