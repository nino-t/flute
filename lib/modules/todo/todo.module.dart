import 'package:flute/modules/todo/screens/todo.screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TodoModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => TodoScreen())
  ];
}
