import 'package:flutter/material.dart';
import 'package:flutter_basic_advanced/answer_button.dart';
import 'package:flutter_basic_advanced/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_basic_advanced/models/quiz_question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void nextQuestion(String answer) {
    widget.onSelectAnswer(answer);

    setState(() {
      if (currentQuestionIndex >= questions.length) {
        return;
      }
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  color: const Color.fromARGB(255, 231, 208, 254),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 48),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () => nextQuestion(answer),
              );
            }),
          ],
        ),
      ),
    );
  }
}
