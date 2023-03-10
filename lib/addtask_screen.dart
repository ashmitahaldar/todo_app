import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

import 'models/note.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'home_screen.dart';

const String noteBoxName = "note";

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleInput = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  late Box<Note> _box;
  late int noteCount;

  @override
  void initState() {
    titleInput.text = "";
    dateInput.text = ""; //set the initial value of text field
    super.initState();
    _box = Hive.box<Note>(noteBoxName);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Add Task'),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // SizedBox(height: 10),
            // text box
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  icon: Icon(Icons.task),
                  hintText: 'E.g Go Shopping',
                  labelText: 'Task',
                ),
                controller: titleInput,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a task.' : null,
              ),
            ),
            // date and time input
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: DateTimePicker(
                type: DateTimePickerType.dateTimeSeparate,
                dateMask: 'd MMM, yyyy',
                //initialValue: DateTime.now().toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                icon: Icon(Icons.event),
                dateLabelText: 'Date',
                timeLabelText: "Time",
                controller: dateInput,
                // selectableDayPredicate: (date) {
                //   // Disable weekend days to select from the calendar
                //   if (date.weekday == 6 || date.weekday == 7) {
                //     return false;
                //   }
                //   return true;
                // },
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Note mData = Note(
                title: titleInput.text,
                datetime: DateTime.parse(dateInput.text),
                complete: false);
            _box.add(mData);
            Navigator.pop(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        HomeScreen(title: 'Home Page')));
          },
          backgroundColor: Colors.blue,
          icon: const Icon(Icons.check),
          label: const Text("Save"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
