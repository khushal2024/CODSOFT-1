import 'package:flutter/material.dart';
import 'package:todo_app/Utilities/my_buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.lightGreenAccent,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),

            //save and cancel button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: ('Save'), onPressed: onSave),

                //save

                MyButton(text: ('Cancel'), onPressed: onCancel),

                //cancel
              ],
            )
          ],
        ),
      ),
    );
  }
}
