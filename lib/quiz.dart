import 'package:flutter/material.dart';
import 'package:flutter_basic_advanced/start_screen.dart';
import 'package:flutter_basic_advanced/questions_screen.dart';
import 'package:flutter_basic_advanced/data/questions.dart';
import 'package:flutter_basic_advanced/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  Widget? activeScreen;
  // var activeScreen = 'start-screen';

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen, 'Learn Flutter the fun way!');
  }

  void restartSurvey() {
    setState(() {
      selectedAnswers.clear();
      activeScreen = StartScreen(switchScreen, 'Learn Flutter the fun way!');
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(
            onBackforward: restartSurvey, answers: selectedAnswers);
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    });
  }
  // void switchScreen() {
  //   setState(() {
  //     activeScreen = 'question-screen';
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // Widget screenWidget = StartPage(switchScreen, 'Learn Flutter the fun way!');

    // if (activeScreen == 'question-screen') {
    //   screenWidget = const QuestionsScreen();
    // }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 134, 70, 198),
                Color.fromARGB(255, 117, 57, 178)
              ],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
