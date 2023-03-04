import 'dart:html';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import "package:flutter/material.dart";
import 'package:intl/intl.dart';

class noteTile extends StatelessWidget {
  String title;
  DateTime datetime;
  noteTile({Key? key, required this.title, required this.datetime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(DateFormat('dd MMMM, yyyy – kk:mm a').format(datetime)),
      ),
    );
  }
}
