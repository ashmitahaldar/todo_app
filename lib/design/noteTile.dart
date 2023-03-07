import 'dart:html';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import "package:flutter/material.dart";
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/home_screen.dart';
import 'package:todo_app/models/note.dart';

const String noteBoxName = "note";

class noteTile extends StatelessWidget {
  final Box<Note> _box = Hive.box<Note>(noteBoxName);
  String title;
  DateTime datetime;
  late int notekey;
  noteTile(
      {Key? key,
      required this.notekey,
      required this.title,
      required this.datetime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(DateFormat('dd MMMM, yyyy – kk:mm a').format(datetime)),
        trailing: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            _box.delete(notekey);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        HomeScreen(title: 'Home Page')));
          },
        ),
      ),
    );
  }
}
