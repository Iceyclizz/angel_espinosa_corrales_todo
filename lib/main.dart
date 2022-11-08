import 'package:angel_espinosa_corrales_todo/controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Todo());
}

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    // app layout
    return const MaterialApp(
      home: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final ToDoController _controller = ToDoController();

  // text field
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // code that returns the appbar
    return Scaffold(
      appBar: AppBar(
          title: const Center(
              child: Text('To-Do List', textAlign: TextAlign.center))),
      body: ListView(children: _getItems()),
      // add items to the to-do list
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(context),
          tooltip: 'Añadir Tarea',
          child: const Icon(Icons.add)),
    );
  }

  // adds data to list.
  void _addTodoItem(String title) {
    //  a set state will notify the app that the state has changed
    setState(() {
      _controller.addList(title);
    });
    _textFieldController.clear();
  }

  Widget _buildTodoItem(String title) {
    return ListTile(title: Text(title));
  }

  Future<AlertDialog> _displayDialog(BuildContext context) async {
    // alter the app state to show a dialog
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Añade una tarea a tu lista'),
            content: TextField(
              controller: _textFieldController,
              decoration:
                  const InputDecoration(hintText: 'Inserta la tarea aquí'),
            ),
            actions: <Widget>[
              // add button
              TextButton(
                child: const Text('AÑADIR'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addTodoItem(_textFieldController.text);
                },
              ),
              // cancel button
              TextButton(
                child: const Text('CANCELAR'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }) as Future<AlertDialog>;
  }

  // iterates through our todo list titles.
  List<Widget> _getItems() {
    final List<Widget> todoWidgets = <Widget>[];
    for (String title in _controller.todoList) {
      todoWidgets.add(_buildTodoItem(title));
    }
    return todoWidgets;
  }
}
