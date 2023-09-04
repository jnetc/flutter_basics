class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final arr = List.of(answers);
    arr.shuffle();
    return arr;
  }
}
