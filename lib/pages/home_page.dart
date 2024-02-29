import 'package:flutter/material.dart';
import 'package:quiz_crafter/constants/my_text.dart';
import 'package:quiz_crafter/constants/navigator.dart';
import 'package:quiz_crafter/model/quiz/quiz_model.dart';
import 'package:quiz_crafter/pages/create_quiz.dart';
import 'package:quiz_crafter/pages/take_quiz.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF272727),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF272727),
        title: const MyText('Quiz App'),
        centerTitle: true,
      ),
      //* On tap it takes user to the "create quiz page"
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => goTo(context, const CreateQuiz()),
        backgroundColor: const Color(0xFF171717),
        label: const MyText('Create Quiz'),
        icon: const Icon(Icons.add),
      ),
      body: Center(
        child: Visibility(
          visible: quizzes.isNotEmpty,
          //* If no quiz is created then this text will be visible
          replacement: const MyText(
            'No quiz created yet',
            size: 40,
            color: Colors.white,
            weight: FontWeight.w200,
          ),
          //* It will display all the created quiz
          child: ListView.builder(
            itemCount: quizzes.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                //* Adds padding between two chips
                padding: const EdgeInsets.only(bottom: 15),
                child: Chip(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.white54,
                  labelPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  deleteIcon: const Icon(Icons.delete, color: Colors.red),
                  //* Deletes the quiz
                  onDeleted: () => setState(() => quizzes.removeAt(index)),
                  //* Takes user to the quiz page where user can attempt quiz
                  label: InkWell(
                    onTap: () => goTo(context, TakeQuiz(quiz: quizzes[index])),
                    child: MyText(
                      quizzes[index].title,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
