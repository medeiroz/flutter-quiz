import 'package:flutter/material.dart';
import 'package:flutter_quiz/app/components/alternative_widget.dart';
import 'package:flutter_quiz/app/entities/question.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
  final void Function(Question question, String alternative)
      onPressedAlternative;

  const QuestionWidget(this.question, this.onPressedAlternative, {super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> awnsersWidgets = question.alternatives
        .map((alternative) => AlternativeWidget(alternative,
            (alternative) => onPressedAlternative(question, alternative)))
        .toList();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Text(
            question.text,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          ...awnsersWidgets,
        ],
      ),
    );
  }
}
