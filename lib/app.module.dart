import 'package:flute/app.screen.dart';
import 'package:flute/modules/todo/todo.module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => CounterScreen()),
    ModuleRoute('/todos', module: TodoModule())
  ];
}
