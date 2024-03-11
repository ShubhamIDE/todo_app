import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo toDo;
  final onToDoChanged;
  final onDeleteItem;

  const ToDoItem(
      {Key? key,
      required this.toDo,
      required this.onToDoChanged,
      required this.onDeleteItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        onTap: () {
          print('Clicked on to do item');
          onToDoChanged(toDo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(
            toDo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: tdBlue),
        title: Text(
          toDo.todoText!,
          style: TextStyle(
              fontSize: 16,
              color: tdBlack,
              decoration: toDo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: tdRed, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () {
              print('Clicked on delete button');
              onDeleteItem();
            },
          ),
        ),
      ),
    );
  }
}
