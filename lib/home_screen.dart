import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/design/noteTile.dart';

import 'addtask_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: const Text(
                  'To-Do List',
                  textAlign: TextAlign.left,
                ),
                bottom: TabBar(
                  controller: _tabController,
                  tabs: const <Widget>[
                    Tab(
                      icon: Icon(Icons.list),
                    ),
                    Tab(
                      icon: Icon(Icons.checklist_outlined),
                    ),
                  ],
                ),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      // open a menu or smth
                    },
                  )
                ]),
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Scaffold(
                    body: ListView(
                  children: _getTodoItems(),
                )),
                Scaffold(
                    body: ListView(
                  children: _getTodoItems(),
                )),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AddTaskScreen(title: "Add Task")));
              },
              backgroundColor: Colors.blue,
              child: const Icon(Icons.add),
            )));
  }
}

Widget _buildTitle() => const Text(
      "Welcome to ToDoList",
      textAlign: TextAlign.left,
    );

List<Widget> _getTodoItems() {
  final List<Widget> _todoItems = <Widget>[];
  for (int i = 0; i < 5; i++) {
    //String title in _todoList
    _todoItems.add(noteTile(title: "Test", datetime: DateTime.now()));
  }
  return _todoItems;
}