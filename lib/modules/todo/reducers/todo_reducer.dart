import 'package:flute/modules/todo/models/todo.dart';

class TodoState {
  List<Todo>? todos;
  TodoState({this.todos});
}

abstract class TodoAction {}

class InitiateTodo extends TodoAction {}

class LoadedTodo extends TodoAction {}

class AddTodo extends TodoAction {
  final Todo? todo;
  AddTodo(this.todo);
}

class DeleteTodo extends TodoAction {
  final int? id;
  DeleteTodo(this.id);
}

TodoState todoReducer(TodoState state, TodoAction action) {
  if (action is InitiateTodo) {
    return TodoState(todos: []);
  } else if (action is AddTodo) {
    final todo = action.todo!;
    todo.id = state.todos!.length + 1;
    state.todos?.add(todo);
    return TodoState(todos: state.todos);
  } else if (action is DeleteTodo) {
    final id = action.id;
    state.todos = state.todos!.where((el) => el.id != id).toList();
    return TodoState(todos: state.todos);
  }

  return state;
}
