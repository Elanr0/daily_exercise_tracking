import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/models/activity_model.dart';

class EditActivityPage extends StatefulWidget{
 
  final ActivityModel activity;

  const EditActivityPage ({super.key, required this.activity});

  @override 
  State<EditActivityPage> createState() => _EditActivityPageState();
}

class _EditActivityPageState extends State<EditActivityPage> {

  late final TextEditingController activityNameController;
  late final TextEditingController activityDetailsController;

  String? selectedCategory;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  @override
  void initState() {
    super.initState();
  void _save(){
   final title = activityNameController.text.trim();
   final detail = activityDetailsController.text.trim();
   

   if (title.isEmpty || detail.isEmpty) return;
   if (selectedCategory == null || startTime == null || endTime == null) return;

   final baseDate = widget.activity.startedAt;
   
   final newStart = DateTime(
  baseDate.year,
  baseDate.month,
  baseDate.day,
  startTime!.hour,
  startTime!.minute,
   );

   final newEnd = DateTime(
    baseDate.year,
    baseDate.month,
    baseDate.day,
    endTime!.hour,
    endTime!.minute,
   );

   if (!newEnd.isAfter(newStart)) return;

   final updated = ActivityModel(title: title, content: detail, category: selectedCategory!, notes: widget.activity.notes, startedAt: newStart, finishedAt: newEnd);

  }


    activityNameController = TextEditingController(text: widget.activity.title);
    activityDetailsController = TextEditingController(text: widget.activity.content);

    selectedCategory = widget.activity.category;
    startTime =TimeOfDay.fromDateTime(widget.activity.startedAt);
    endTime = TimeOfDay.fromDateTime(widget.activity.finishedAt);

  }

  @override
  void dispose() {
    activityNameController.dispose();
    activityDetailsController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Activity")),
      body: const SizedBox(),
    );
  }
}