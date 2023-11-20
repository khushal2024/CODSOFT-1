import 'package:flutter/material.dart';
import 'package:todo_app/Utilities/dialogbox.dart';
import 'package:todo_app/Utilities/todo_tile.dart';
import 'package:todo_app/Utilities/my_buttons.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  //list of todo task
  List toDolist = [
    ["Make exercise ", false],
    ["Do work", false],
  ];
  // text controller
  final _controller = TextEditingController();
  //check box tapperd
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDolist[index][1] = !toDolist[index][1];
    });
  }
//save new task

  void saveNewTask() {
    setState(() {
      toDolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

// create a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  //delete tast
  void deleteTask(int index) {
    setState(() {
      toDolist.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
        title: Text('To Do List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDolist.length,
        itemBuilder: (context, index) {
          return todo_tile(
            taskname: toDolist[index][0],
            taskcompleted: toDolist[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask,
          );
        },
      ),
    );
  }
}
