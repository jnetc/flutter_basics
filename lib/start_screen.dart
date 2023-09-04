import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, this.title, {super.key});

  final String title;
  final void Function() switchScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(150, 179, 170, 243),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 20.0),
          child: Text(
            title,
            style: const TextStyle(
                color: Color.fromARGB(255, 220, 208, 249), fontSize: 24),
          ),
        ),
        OutlinedButton.icon(
          onPressed: switchScreen,
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 207, 190, 243),
            textStyle: const TextStyle(fontSize: 16),
          ),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Start Quiz'),
        )
      ]),
    );
  }
}
