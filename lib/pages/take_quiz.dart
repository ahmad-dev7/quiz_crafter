import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:quiz_crafter/constants/lottie_player.dart';
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

class _TakeQuizState extends State<TakeQuiz>
    with SingleTickerProviderStateMixin {
  int currentQuestion = 1;
  Color? selectedOptionColor = const Color(0xFFB1B1B1);
  Color? correctOptionColor = const Color(0xE9FFFFFF);
  int? selectedOption;
  bool isSelected = false;
  bool showAnimation = false;
  late int answerIndex;
  late Quiz quiz;
  late AnimationController animationController;
  Offset beginAnimationFrom = const Offset(1, 0);
  @override
  void initState() {
    quiz = widget.quiz;
    answerIndex = quiz.questions[currentQuestion - 1].answerIndex;
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isDesktop = size.width > 600;
    return Scaffold(
      backgroundColor: const Color(0xFF272727),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? size.width * .07 : 0,
              vertical: isDesktop ? size.height * .05 : 10,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //* Question number info and reveal button

                  QuizHeader(
                    onReveal: onReveal,
                    info:
                        'Question  $currentQuestion / ${quiz.questions.length}',
                  ),

                  const Spacer(),
                  const SizedBox(height: 20),
                  //* Previous button / Question text / Next button
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: isDesktop ? 50 : 0),
                    child: Row(
                      children: [
                        //Previous button
                        MoveToButton(
                          visibility: currentQuestion != 1,
                          onTap: () => moveTo('-'),
                          label: '',
                          icon: Icons.arrow_back_ios_new_outlined,
                          color: const Color(0xFF292929),
                        ),
                        const Spacer(),
                        //Question text
                        Flexible(
                          flex: isDesktop ? 2 : 5,
                          child: SizedBox(
                            height: isDesktop ? 56 * 3 : 56 * 5,
                            child: ClipRRect(
                              child: Animate(
                                controller: animationController,
                                effects: [
                                  SlideEffect(
                                    begin: beginAnimationFrom,
                                    end: Offset.zero,
                                  ),
                                ],
                                child: Center(
                                  child: MyText(
                                    quiz.questions[currentQuestion - 1]
                                        .question,
                                    textAlign: TextAlign.center,
                                    size: 35,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        //Next button
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
                              title: ClipRRect(
                                child: Animate(
                                  controller: animationController,
                                  effects: [
                                    SlideEffect(begin: beginAnimationFrom)
                                  ],
                                  child: MyText(
                                    quiz.questions[currentQuestion - 1]
                                        .options[index],
                                    color: Colors.black,
                                    weight: FontWeight.w500,
                                  ),
                                ),
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
                ],
              ),
            ),
          ),
          if (selectedOption != null && selectedOption != -1)
            Align(
              child: Visibility(
                visible: showAnimation &&
                    selectedOption ==
                        quiz.questions[currentQuestion - 1].answerIndex,
                child: LottieAnimationPlayer(
                  filePath: 'assets/lottie_animations/party_popper.json',
                  onComplete: () => setState(() => showAnimation = false),
                ),
              ),
            ),
        ],
      ),
    );
  }

  //* On reveal show if user have picked correct or wrong option.
  onReveal() {
    int answerIndex = quiz.questions[currentQuestion - 1].answerIndex;
    setState(() => correctOptionColor = const Color(0xFF58FF8D));
    if (selectedOption == answerIndex) {
      setState(() {
        showAnimation = true;
        selectedOptionColor = const Color(0xFF58FF8D);
      });
    } else {
      setState(() {
        showAnimation = true;
        selectedOptionColor = const Color(0xFFFF5959);
      });
    }
    if (showAnimation) {
      Future.delayed(const Duration(seconds: 1)).whenComplete(
        () => setState(() => showAnimation = false),
      );
    }
  }

  //* Move to next or previous question
  moveTo(String moveTo) {
    if (moveTo == '+') {
      setState(() {
        animationController.reset();
        beginAnimationFrom = const Offset(1, 0);
        animationController.forward();
        correctOptionColor = const Color(0xE9FFFFFF);
        selectedOptionColor = const Color(0xE9FFFFFF);
        selectedOption = -1;
        currentQuestion++;
      });
    } else {
      setState(() {
        animationController.reset();
        beginAnimationFrom = const Offset(-1, 0);
        animationController.forward();
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
