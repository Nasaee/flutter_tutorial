import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _controller = TextEditingController();
  TodoPriority priority = TodoPriority.normal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Colors.blue[300],
        onPressed: () {
          addTodo();
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: Text('My Todos'),
      ),
      body: MyTodo.todos.isEmpty
          ? Center(
              child: Text('Nothing to do'),
            )
          : ListView.builder(
              itemCount: MyTodo.todos.length,
              itemBuilder: (context, index) {
                final todo = MyTodo.todos[index];
                return TodoItem(
                    todo: todo,
                    onChanged: (value) {
                      setState(() {
                        MyTodo.todos[index].completed = value;
                      });
                    });
              },
            ),
    );
  }

  void addTodo() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setBuilderState) => Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            left: 16.0,
            right: 16.0,
            bottom: 16.0,
          ),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'What to do?',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Select Piority'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<TodoPriority>(
                    value: TodoPriority.low,
                    groupValue: priority,
                    onChanged: (value) {
                      setBuilderState(() {
                        priority = value!;
                      });
                    },
                  ),
                  Text(TodoPriority.low.name),
                  Radio<TodoPriority>(
                    value: TodoPriority.normal,
                    groupValue: priority,
                    onChanged: (value) {
                      setBuilderState(() {
                        priority = value!;
                      });
                    },
                  ),
                  Text(TodoPriority.normal.name),
                  Radio<TodoPriority>(
                    value: TodoPriority.high,
                    groupValue: priority,
                    onChanged: (value) {
                      setBuilderState(() {
                        priority = value!;
                      });
                    },
                  ),
                  Text(TodoPriority.high.name),
                ],
              ),
              ElevatedButton(
                onPressed: _save,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _save() {
    if (_controller.text.isEmpty) {
      showMsg(context, 'Input field cannot be empty');
      return;
    }
    final todo = MyTodo(
      id: MyTodo.todos.length + 1,
      name: _controller.text,
      priority: priority,
    );

    MyTodo.todos.add(todo);
    setState(() {
      _controller.clear();
      Navigator.pop(context);
    });
  }
}

void showMsg(BuildContext context, String s) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Caution!'),
      content: Text(s),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('CLOSE'),
        ),
      ],
    ),
  );
}

enum TodoPriority { low, normal, high }

class TodoItem extends StatelessWidget {
  final MyTodo todo;
  final Function(bool) onChanged;
  const TodoItem({super.key, required this.todo, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: Text(todo.name),
        subtitle: Text('Priority: ${todo.priority.name}'),
        value: todo.completed,
        onChanged: (value) {
          onChanged(value!);
        });
  }
}

class MyTodo {
  int id;
  String name;
  bool completed;
  TodoPriority priority;

  MyTodo({
    required this.id,
    required this.name,
    this.completed = false,
    required this.priority,
  });

  static List<MyTodo> todos = [];
}
