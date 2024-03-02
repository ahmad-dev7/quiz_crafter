import 'package:flutter/material.dart';
import 'package:quiz_crafter/constants/move_to_button.dart';
import 'package:quiz_crafter/constants/my_text.dart';
import 'package:quiz_crafter/constants/take_quiz_header.dart';
import 'package:quiz_crafter/model/quiz/quiz_model.dart';

class TakeQuiz extends StatefulWidget {
  final Quiz quiz;
  const TakeQuiz({super.key, required this.quiz});

  @override
  State<TakeQuiz> createState() => _TakeQuizState();
}

class _TakeQuizState extends State<TakeQuiz> {
  int currentQuestion = 1;
  Color? selectedOptionColor = const Color(0xFFB1B1B1);
  Color? correctOptionColor = const Color(0xE9FFFFFF);
  int? selectedOption;
  bool isSelected = false;
  late Quiz quiz;
  @override
  void initState() {
    setState(() => quiz = widget.quiz);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF272727),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * .07,
          vertical: size.height * .05,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //* Question number info and reveal button

              QuizHeader(
                onReveal: onReveal,
                info: 'Question  $currentQuestion / ${quiz.questions.length}',
              ),

              const Spacer(),
              const SizedBox(height: 20),
              //* Question text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  children: [
                    MoveToButton(
                      visibility: currentQuestion != 1,
                      onTap: () => moveTo('-'),
                      label: '',
                      icon: Icons.arrow_back_ios_new_outlined,
                      color: const Color(0xFF292929),
                    ),
                    const Spacer(),
                    Flexible(
                      flex: 2,
                      child: SizedBox(
                        height: 150,
                        child: MyText(
                          quiz.questions[currentQuestion - 1].question,
                          textAlign: TextAlign.center,
                          size: 35,
                        ),
                      ),
                    ),
                    const Spacer(),
                    MoveToButton(
                      visibility: currentQuestion < quiz.questions.length,
                      onTap: () => moveTo('+'),
                      label: '',
                      icon: Icons.arrow_forward_ios_outlined,
                      color: const Color(0xFF292929),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              const SizedBox(height: 20),

              //* Options
              FractionallySizedBox(
                widthFactor: 0.55,
                child: SizedBox(
                  height: 56 * 5.5,
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ListTile(
                          onTap: () => setState(() {
                            selectedOption = index;
                            selectedOptionColor = const Color(0xFFB1B1B1);
                          }),
                          selected: selectedOption == index,
                          selectedTileColor: selectedOptionColor,
                          tileColor: getTileColor(index),
                          horizontalTitleGap: -10,
                          //* Option number like a,b,c,d
                          leading: MyText(
                            leadingText(index),
                            color: Colors.black54,
                            weight: FontWeight.bold,
                          ),
                          //* Options
                          title: MyText(
                            quiz.questions[currentQuestion - 1].options[index],
                            color: Colors.black,
                            weight: FontWeight.w500,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              const Spacer(),

              //* Previous and Next button
              // FractionallySizedBox(
              //   widthFactor: 0.8,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       //* Go to Previous question button
              //       MoveToButton(
              //         visibility: currentQuestion != 1,
              //         onTap: () => moveTo('-'),
              //         label: 'Previous',
              //         color: Colors.blueGrey.withOpacity(0.9),
              //         icon: Icons.arrow_back_ios,
              //       ),
              //       const SizedBox(width: 20),
              //       //* Go to next question button
              //       MoveToButton(
              //         visibility: currentQuestion < quiz.questions.length,
              //         onTap: () => moveTo('+'),
              //         label: 'Next',
              //         color: Colors.blueAccent,
              //         icon: Icons.arrow_forward_ios,
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  //* On reveal show if user have picked correct or wrong option.
  onReveal() {
    int answerIndex = quiz.questions[currentQuestion - 1].answerIndex;
    setState(() => correctOptionColor = const Color(0xFF58FF8D));
    if (selectedOption == answerIndex) {
      setState(() => selectedOptionColor = const Color(0xFF58FF8D));
    } else {
      setState(() => selectedOptionColor = const Color(0xFFFF5959));
    }
  }

  //* Move to next or previous question
  moveTo(String moveTo) {
    if (moveTo == '+') {
      setState(() {
        correctOptionColor = const Color(0xE9FFFFFF);
        selectedOptionColor = const Color(0xE9FFFFFF);
        selectedOption = -1;
        currentQuestion++;
      });
    } else {
      setState(() {
        correctOptionColor = const Color(0xE9FFFFFF);
        selectedOptionColor = const Color(0xE9FFFFFF);
        selectedOption = -1;
        currentQuestion--;
      });
    }
  }

  //* Returns tile color by checking if it is selected or not
  Color? getTileColor(int index) {
    if (index == quiz.questions[currentQuestion - 1].answerIndex) {
      return correctOptionColor;
    } else {
      return const Color(0xF6FFFFFF);
    }
  }

  //* Leading option alphabet like a)
  String leadingText(int i) {
    String leading = '';
    switch (i) {
      case 0:
        return leading = 'A)';
      case 1:
        return leading = 'B)';
      case 2:
        return leading = 'C)';
      case 3:
        return leading = 'D)';
    }
    return leading;
  }
}
