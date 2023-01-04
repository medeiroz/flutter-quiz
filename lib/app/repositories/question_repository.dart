import 'package:flutter_quiz/app/entities/question.dart';

class QuestionRepository {
  static final List<Question> questions = [
    Question(
      text: 'Quantos dias são necessários para a Terra orbitar o sol?',
      answer: '365',
      alternatives: ['363', '364', '365', '366'],
    ),
    Question(
      text: 'Qual é o menor país do mundo?',
      answer: 'Vaticano',
      alternatives: ['Vaticano', 'Maldivas', 'Mônaco', 'Singapura'],
    ),
    Question(
      text: 'Em que ano começou a segunda guerra mundial?',
      answer: '1939',
      alternatives: ['1930', '1939', '1941', '1945'],
    ),
    Question(
      text: '"Penso, logo existo" foi uma frase dita por qual filósofo?',
      answer: 'René Descartes',
      alternatives: ['Aristóteles', 'Sócrates', 'René Descartes', 'Platão'],
    ),
    Question(
      text:
          'Qual foi o grande pintor que cortou sua própria orelha fora e a entregou a uma garota de programa?',
      answer: 'Vicent Van Gogh',
      alternatives: [
        'Pablo Picasso',
        'Vicent Van Gogh',
        'Pierre-Auguste Renoir',
        'Leonardo da Vinci'
      ],
    )
  ];

  List<Question> getList() {
    var questionsSuffled = questions..shuffle();

    return questionsSuffled.map((question) {
      question.alternatives = question.alternatives..shuffle();
      return question;
    }).toList();
  }
}
