import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'app.screen.g.dart';

@hwidget
Widget appScreen() => MaterialApp(
      initialRoute: '/',
    ).modular();

@hwidget
Widget counterScreen(BuildContext context) {
  final counter = useState<int>(0);
  return Scaffold(
      appBar: AppBar(
        title: Text("Counter Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.blue,
              ),
              onPressed: () {
                Modular.to.pushNamed('/todos');
              },
              child: Text('Open To Do Apps'),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counter.value}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value++;
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ));
}
