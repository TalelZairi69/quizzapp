import 'package:flutter/material.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _questionIndex = 0;
  int _score = 0;
  final List<Map<String, Object>> _questions = [
    {
      'question': 'What is the capital of France?',
      'answers': [
        {'text': 'Paris', 'correct': true},
        {'text': 'Madrid', 'correct': false},
        {'text': 'Rome', 'correct': false},
        {'text': 'London', 'correct': false},
      ],
    },
    {
      'question': 'What is the largest planet in our solar system?',
      'answers': [
        {'text': 'Mars', 'correct': false},
        {'text': 'Jupiter', 'correct': true},
        {'text': 'Venus', 'correct': false},
        {'text': 'Saturn', 'correct': false},
      ],
    },
    {
      'question': 'What is the smallest country in the world by land area?',
      'answers': [
        {'text': 'San Marino', 'correct': false},
        {'text': 'Monaco', 'correct': false},
        {'text': 'Vatican City', 'correct': true},
        {'text': 'Andorra', 'correct': false},
      ],
    },
    {
      'question': 'Who painted the Mona Lisa?',
      'answers': [
        {'text': 'Michelangelo', 'correct': false},
        {'text': 'Leonardo da Vinci', 'correct': true},
        {'text': 'Raphael', 'correct': false},
        {'text': 'Vincent van Gogh', 'correct': false},
      ],
    },
  ];

  void _answerQuestion(bool correct) {
    setState(() {
      if (correct) {
        _score += 1;
      }
      _questionIndex += 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        backgroundColor: Colors.black,
      ),
      body: _questionIndex < _questions.length
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 16),
                Text(
                  'Question ${_questionIndex + 1}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 16),
                Text(
                  _questions[_questionIndex]['question'] as String,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ...(_questions[_questionIndex]['answers']
                        as List<Map<String, Object>>)
                    .map((answer) => Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: ElevatedButton(
                            child: Text(answer['text'] as String),
                            onPressed: () =>
                                _answerQuestion(answer['correct'] as bool),
                          ),
                        ))
                    .toList(),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Done! Your score = $_score/${_questions.length}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text('Restart Quiz'),
                  onPressed: _resetQuiz,
                ),
              ],
            ),
    );
  }
}
