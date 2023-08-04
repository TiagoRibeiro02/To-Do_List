import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: controller,
                decoration:
                  InputDecoration(border: OutlineInputBorder(),
                  hintText: 'Add a new Task',
                  ),

            ),

            //buttons
            Row(
              mainAxisAlignment:  MainAxisAlignment.end,
              children: [
                MaterialButton(
                    onPressed: onSave,
                    child: Text('Save'),
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 8,),
                MaterialButton(
                  onPressed: onCancel,
                  child: Text('Cancel'),
                  color: Theme.of(context).primaryColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
