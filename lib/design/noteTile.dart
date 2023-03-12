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
  Note note;
  noteTile({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Dismissible(
      key: Key('${note.key}-${note.title}'),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        _box.delete(note.key);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Item deleted"),
        ));
      },
      child: ListTile(
        leading: Checkbox(
          value: note.complete,
          onChanged: (bool? value) {
            note.complete = value!;
            note.save();
          },
        ),
        title: Text(note.title),
        subtitle:
            Text(DateFormat('dd MMMM, yyyy – KK:mm a').format(note.datetime)),
        // trailing: IconButton(
        //   icon: const Icon(Icons.check),
        //   onPressed: () {
        //     note.complete = true;
        //     note.save();
        //   },
        // ),
      ),
    ));
  }
}
// return Card(
//   child: ListTile(
//     title: Text(note.title),
//     subtitle:
//         Text(DateFormat('dd MMMM, yyyy – kk:mm a').format(note.datetime)),
//     trailing: IconButton(
//       icon: const Icon(Icons.close),
//       onPressed: () {
//         _box.delete(note.key);
//         Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//                 builder: (BuildContext context) =>
//                     HomeScreen(title: 'Home Page')));
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text("Item deleted"),
//         ));
//       },
//     ),
//   ),
// );
