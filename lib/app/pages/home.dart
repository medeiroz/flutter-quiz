import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_quiz/app/components/question_widget.dart';
import 'package:flutter_quiz/app/entities/question.dart';
import 'package:flutter_quiz/app/repositories/question_repository.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final QuestionRepository _questionRepository = Modular.get();
  List<Question> _questions = [];

  List<bool> _answers = [];
  int _questionIndex = 0;
  bool _showResult = false;
  String _result = '';

  _MyHomePageState() {
    _questions = _questionRepository.getList();
  }

  String _resultCalculator() {
    int correctAnswers = _answers.where((answers) => answers).length;
    return 'You got $correctAnswers out of ${_questions.length} questions right';
  }

  void _nextQuestion() {
    if (_questionIndex < _questions.length - 1) {
      _questionIndex++;
    } else {
      _result = _resultCalculator();
      _showResult = true;
    }
  }

  void _answer(Question question, String answer) {
    setState(() {
      _answers.add(question.answer == answer);
      _nextQuestion();
    });
  }

  void _reset() {
    setState(() {
      _answers = [];
      _questionIndex = 0;
      _showResult = false;
      _questions = _questionRepository.getList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _showResult == false
              ? [QuestionWidget(_questions[_questionIndex], _answer)]
              : [Text(_result)],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _reset(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
