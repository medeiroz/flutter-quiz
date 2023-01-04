import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_quiz/app/pages/home.dart';
import 'package:flutter_quiz/app/repositories/question_repository.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => QuestionRepository()),
      ];

  @override
  List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => const MyHomePage(title: 'Quiz'),
    )
  ];
}
