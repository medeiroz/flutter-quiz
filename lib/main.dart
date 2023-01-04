import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_quiz/app/app_module.dart';
import 'package:flutter_quiz/app/helpers.dart';

void main() => runApp(
      ModularApp(
        module: AppModule(),
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Quiz',
      theme: ThemeData(
        primarySwatch:
            Helpers.buildMaterialColor(const Color.fromRGBO(142, 36, 170, 1)),
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
