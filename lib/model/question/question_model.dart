class Question {
  final String question;
  final List<String> options;

  /// Answer index should be between 1 to 4 and do not consider it as list index
  final int answerIndex;
  Question({
    required this.question,
    required this.options,
    required this.answerIndex,
  });
}
