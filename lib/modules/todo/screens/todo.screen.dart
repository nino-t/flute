import 'package:flute/modules/todo/models/todo.dart';
import 'package:flute/modules/todo/reducers/todo_reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';

part 'todo.screen.g.dart';

@hwidget
Widget todoScreen(BuildContext context) {
  final Store<TodoState, TodoAction> todoStore = useReducer(todoReducer,
      initialState: TodoState(), initialAction: InitiateTodo());
  return Provider(
    create: (_) => todoStore,
    child: Scaffold(
        appBar: AppBar(
          title: Text("To Do App"),
        ),
        body: Container(
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [Expanded(child: TodoList()), TodoInputSection()],
          ),
        )),
  );
}

@hwidget
Widget todoInputSection(BuildContext context) {
  final store = Provider.of<Store<TodoState, TodoAction>>(context);
  final todoNameTextController = useTextEditingController();
  return Container(
      child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: TextField(
          controller: todoNameTextController,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 3)),
        )),
        ElevatedButton(
            onPressed: () {
              Todo todo = Todo(id: 0, name: todoNameTextController.text);
              store.dispatch(AddTodo(todo));
              todoNameTextController.text = "";
            },
            child: Icon(Icons.add),
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(), padding: EdgeInsets.all(10)))
      ],
    ),
  ));
}

@hwidget
Widget todoList(BuildContext context) {
  final store = Provider.of<Store<TodoState, TodoAction>>(context);
  final items = store.state.todos;
  return Container(
    child: ListView.builder(
        itemCount: items!.length,
        itemBuilder: (context, idx) {
          final item = items[idx];
          return Dismissible(
              key: Key(item.id.toString()),
              onDismissed: (direction) {
                store.dispatch(DeleteTodo(item.id));
              },
              background: Container(
                color: Colors.red,
              ),
              child: ListTile(
                title: Text(item.name!),
              ));
        }),
  );
}
