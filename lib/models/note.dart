class Note {
  final int id;
  final String title;
  final int datetime; // date-time will be stored as int; DateTime.millisecondsSinceEpoch(value); DateTime.from MillisecondsSinceEpoch(value)
  static const String TABLENAME = "notes";

  Note({required this.id, required this.title, required this.datetime});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'datetime': datetime};
  }
}
