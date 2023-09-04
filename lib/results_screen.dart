import 'package:flutter/material.dart';
import 'package:flutter_basic_advanced/data/questions.dart';
import 'package:flutter_basic_advanced/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.onBackforward, required this.answers});

  final List<String> answers;
  final void Function() onBackforward;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> result = [];

    for (var i = 0; i < answers.length; i++) {
      result.add({
        'question_index': i,
        'question': questions[i].text,
        'currect_answer': questions[i].answers[0],
        'user_answer': answers[i],
        'is_correct': questions[i].answers[0] == answers[i]
      });
    }

    return result;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final currectAnswers = summaryData.where((data) {
      return data['currect_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answered $currectAnswers out of $totalQuestions questions correctly!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromARGB(255, 236, 226, 249), fontSize: 20),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(getSummaryData()),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onBackforward,
              icon: const Icon(Icons.refresh, color: Colors.white),
              label: const Text(
                'Restart Quiz!',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
