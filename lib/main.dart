import 'package:flute/app.module.dart';
import 'package:flute/app.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: AppScreen()));
}
