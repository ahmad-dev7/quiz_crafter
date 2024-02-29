import 'package:flutter/material.dart';
import 'package:quiz_crafter/constants/my_button.dart';
import 'package:quiz_crafter/constants/my_dialog.dart';
import 'package:quiz_crafter/constants/navigator.dart';
import 'package:quiz_crafter/constants/options_textfield.dart';
import 'package:quiz_crafter/constants/question_textfield.dart';
import 'package:quiz_crafter/constants/title_textfield.dart';
import 'package:quiz_crafter/model/question/question_model.dart';
import 'package:quiz_crafter/model/quiz/quiz_model.dart';
import 'package:quiz_crafter/pages/home_page.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({super.key});

  @override
  State<CreateQuiz> createState() => CreateQuizState();
}

class CreateQuizState extends State<CreateQuiz> {
  TextEditingController titleController = TextEditingController();
  TextEditingController questionController = TextEditingController();
  TextEditingController firstOptionController = TextEditingController();
  TextEditingController secondOptionController = TextEditingController();
  TextEditingController thirdOptionController = TextEditingController();
  TextEditingController fourthOptionController = TextEditingController();
  bool firstOption = false;
  bool secondOption = false;
  bool thirdOption = false;
  bool fourthOption = false;
  int? correctOption;
  List<Question> questions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF272727),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        //* Quiz title field
        title: TitleTextField(controller: titleController, label: 'Quiz title'),
        centerTitle: true,
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),

              //* Question textfield
              QuestionTextField(
                label: 'Enter question',
                controller: questionController,
              ),

              const Spacer(),

              OptionsTextField(
                onChange: (index) => setCorrectOption(index),
                firstOptionController: firstOptionController,
                secondOptionController: secondOptionController,
                thirdOptionController: thirdOptionController,
                fourthOptionController: fourthOptionController,
                firstOption: firstOption,
                secondOption: secondOption,
                thirdOption: thirdOption,
                fourthOption: fourthOption,
              ),

              const Spacer(),

              //* Buttons to add question and submit quiz
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton(
                    onTap: addQuestion,
                    label: 'Add Question',
                    color: Colors.blueGrey.shade700,
                  ),
                  const Spacer(),
                  MyButton(
                    onTap: createQuiz,
                    label: 'Submit Quiz',
                    color: Colors.black12.withOpacity(0.2),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  //* Add's the question in currently titled quiz
  addQuestion() {
    if (isQuestionValidated()) {
      questions.add(
        Question(
          question: questionController.text,
          options: [
            firstOptionController.text,
            secondOptionController.text,
            thirdOptionController.text,
            fourthOptionController.text,
          ],
          answerIndex: correctOption! - 1,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${questions.length} question added'),
          duration: const Duration(milliseconds: 1500),
        ),
      );
      questionController.clear();
      firstOptionController.clear();
      secondOptionController.clear();
      thirdOptionController.clear();
      fourthOptionController.clear();
      setCorrectOption(-1);
    } else {
      myDialog('Please fill all textfield  and pick correct option', context);
    }
  }

  //* Create quiz with all added questions with give title
  createQuiz() {
    if (titleController.text.isNotEmpty) {
      if (questions.isNotEmpty) {
        quizzes.add(Quiz(titleController.text, questions: questions));
        goTo(context, const HomePage());
      } else {
        myDialog('You haven\'t added any question yet in this quiz', context);
      }
    } else {
      myDialog('Please enter title of this quiz', context);
    }
  }

  //* Checks if the the question filled and all the options are filled and correct option is also picked
  bool isQuestionValidated() {
    if (questionController.text.isNotEmpty &&
        firstOptionController.text.isNotEmpty &&
        secondOptionController.text.isNotEmpty &&
        thirdOptionController.text.isNotEmpty &&
        fourthOptionController.text.isNotEmpty &&
        correctOption != null) {
      return true;
    } else {
      return false;
    }
  }

  //* Sets the picked option as correct  one for current question
  setCorrectOption(int index) {
    switch (index + 1) {
      case 1:
        setState(() {
          firstOption = true;
          secondOption = false;
          thirdOption = false;
          fourthOption = false;
          correctOption = index + 1;
        });
        break;
      case 2:
        setState(() {
          firstOption = false;
          secondOption = true;
          thirdOption = false;
          fourthOption = false;
          correctOption = index + 1;
        });
        break;
      case 3:
        setState(() {
          firstOption = false;
          secondOption = false;
          thirdOption = true;
          fourthOption = false;
          correctOption = index + 1;
        });
        break;
      case 4:
        setState(() {
          firstOption = false;
          secondOption = false;
          thirdOption = false;
          fourthOption = true;
          correctOption = index + 1;
        });
        break;
      default:
        setState(() {
          firstOption = false;
          secondOption = false;
          thirdOption = false;
          fourthOption = false;
        });
    }
  }
}
