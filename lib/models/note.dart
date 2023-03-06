import 'package:hive/hive.dart';

part 'note.hive_generator.g.dart';

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final DateTime datetime;
  @HiveField(3)
  final bool complete;

  Note(
      {required this.id,
      required this.title,
      required this.datetime,
      required this.complete});
}


// class Note {
//   final int id;
//   final String title;
//   final int datetime; // date-time will be stored as int; DateTime.millisecondsSinceEpoch(value); DateTime.from MillisecondsSinceEpoch(value)
//   static const String TABLENAME = "notes";

//   Note({required this.id, required this.title, required this.datetime});

//   Map<String, dynamic> toMap() {
//     return {'id': id, 'title': title, 'datetime': datetime};
//   }
// }
