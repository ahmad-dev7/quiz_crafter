import 'package:quiz_crafter/model/question/question_model.dart';

List<Quiz> quizzes = [];

class Quiz {
  final String title;
  final List<Question> questions;
  Quiz(this.title, {required this.questions});
}

addQuizManually() {
  quizzes.add(
    Quiz(
      // This is the title which will be displayed on the home page to let you know about the quiz
      'Demo Quiz',
      questions: [
        Question(
          //* Question
          question: 'What is the use of setState() in Flutter?',
          //* Options
          options: [
            'To update State of widget',
            'To rebuild widget tree',
            'Both A and B',
            'None of the above',
          ],
          //* Correct answer index,
          //? Note that it ranges from 0-3 so if correct answer is at first position then answerIndex would be 0
          answerIndex: 2,
        ),
        Question(
          question: 'What is the purpose of the MaterialApp widget in Flutter?',
          options: [
            'To define the entry point of the application',
            'To define the overall structure of the application',
            'To define the theme of the application',
            'None of the above',
          ],
          answerIndex: 1,
        ),
        Question(
          question: 'What is the purpose of the Scaffold widget in Flutter?',
          options: [
            'To provide a visual structure to a material design app',
            'To define the layout of the application',
            'To handle navigation between screens',
            'None of the above',
          ],
          answerIndex: 0,
        ),
        Question(
          question:
              'What does the mainAxisSize property of a Row or Column widget control?',
          options: [
            'The size of the widget in the main axis direction',
            'The size of the widget in the cross axis direction',
            'The spacing between children',
            'None of the above',
          ],
          answerIndex: 0,
        ),
        Question(
          question: 'What is a StatelessWidget in Flutter?',
          options: [
            'A widget that can be updated dynamically',
            'A widget that cannot be updated dynamically',
            'A widget that manages state',
            'None of the above',
          ],
          answerIndex: 1,
        ),
        Question(
          question:
              'What is the purpose of the crossAxisAlignment property in a Row or Column widget?',
          options: [
            'To align children along the main axis',
            'To align children along the cross axis',
            'To specify the direction of the children',
            'None of the above',
          ],
          answerIndex: 1,
        ),
        Question(
          question:
              'What does the mainAxisAlignment property of a Row or Column widget control?',
          options: [
            'The alignment of children along the main axis',
            'The alignment of children along the cross axis',
            'The direction of the children',
            'None of the above',
          ],
          answerIndex: 0,
        ),
        Question(
          question: 'What is the purpose of the ListView widget in Flutter?',
          options: [
            'To display a scrollable list of children',
            'To create a grid layout of children',
            'To handle user input events',
            'None of the above',
          ],
          answerIndex: 0,
        ),
        Question(
          question: 'What is the purpose of the InkWell widget in Flutter?',
          options: [
            'To provide a visual response to touch events',
            'To manage stateful interactions',
            'To create animations',
            'None of the above',
          ],
          answerIndex: 0,
        ),
        Question(
          question:
              'What is the purpose of the FutureBuilder widget in Flutter?',
          options: [
            'To asynchronously build a widget based on a Future',
            'To manage routing and navigation',
            'To handle user input events',
            'None of the above',
          ],
          answerIndex: 0,
        ),
      ],
    ),
  );
}
