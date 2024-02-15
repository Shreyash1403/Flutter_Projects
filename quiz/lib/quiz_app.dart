import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State createState() => _QuizAppState();
}

class SingleQuestionModel {
  final String? question;
  final List<String>? options;
  final int? answerIndex;

  const SingleQuestionModel({this.question, this.options, this.answerIndex});
}

class _QuizAppState extends State {
  List allQuestions = [
    const SingleQuestionModel(
        question: "What is Dart?",
        options: [
          "An operating system",
          "A programming language",
          "A framework",
          "A database"
        ],
        answerIndex: 1),
    const SingleQuestionModel(
        question: "Which programming language is used to write Flutter apps?",
        options: ["Java", "Kotlin", " Dart", "Python"],
        answerIndex: 2),
    const SingleQuestionModel(
        question: "What is Flutter?",
        options: [
          "A database",
          "A programming language",
          "An operating system",
          " A framework",
        ],
        answerIndex: 3),
    const SingleQuestionModel(
        question:
            "Which command is used to create a new Flutter project from the command line?",
        options: [
          "flutter start",
          "flutter news",
          "flutter create",
          "flutter init"
        ],
        answerIndex: 2),
    const SingleQuestionModel(
        question: "Which widget is the base class for every widget in Flutter?",
        options: [
          "Scaffold",
          "Container",
          " StatelessWidget",
          "StatefulWidget"
        ],
        answerIndex: 2),
  ];

  bool startedQuiz = false;
  bool questionScreen = true;
  int questionIndex = 0;
  int selectedIndex = -1;
  int noOfCorrectAnswer = 0;

  MaterialStateProperty<Color?> checkAnswer(int buttonIndex) {
    if (selectedIndex != -1) {
      if (buttonIndex == allQuestions[questionIndex].answerIndex) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (buttonIndex == selectedIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(Colors.white30);
      }
    } else {
      return const MaterialStatePropertyAll(Colors.white30);
    }
  }

  void questionChange() {
    if (!startedQuiz) {
      setState(() {
        startedQuiz = true;
      });
    }
    if (selectedIndex == -1) {
      return;
    }

    if (selectedIndex == allQuestions[questionIndex].answerIndex) {
      noOfCorrectAnswer++;
    }

    if (selectedIndex != -1) {
      if (questionIndex == allQuestions.length - 1) {
        questionScreen = false;
      }
      setState(() {
        questionIndex++;
        selectedIndex = -1;
      });
    }
  }

  Scaffold isQuestionScreen() {
    if (!startedQuiz) {
      return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text(
            "QuizApp",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          backgroundColor: Colors.grey[700],
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: questionChange,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  Colors.grey[700]), // Set color to grey
            ),
            child: const Text("Start Quiz"),
          ),
        ),
      );
    }
    if (questionScreen == true) {
      return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text(
            "QuizApp",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w800, color: Colors.black),
          ),
          backgroundColor: Colors.grey[700],
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Questions :",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${questionIndex + 1}/${allQuestions.length}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 80,
              width: 300,
              child: Text(
                allQuestions[questionIndex].question,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(0),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: () {
                    if (selectedIndex == -1) {
                      setState(() {
                        selectedIndex = 0;
                      });
                    }
                  },
                  child: Text(
                    "A. ${allQuestions[questionIndex].options[0]}",
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                    ),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(1),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: () {
                    if (selectedIndex == -1) {
                      setState(() {
                        selectedIndex = 1;
                      });
                    }
                  },
                  child: Text(
                    "B. ${allQuestions[questionIndex].options[1]}",
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                    ),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(2),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: () {
                    if (selectedIndex == -1) {
                      setState(() {
                        selectedIndex = 2;
                      });
                    }
                  },
                  child: Text(
                    "C. ${allQuestions[questionIndex].options[2]}",
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                    ),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(3),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: () {
                    if (selectedIndex == -1) {
                      setState(() {
                        selectedIndex = 3;
                      });
                    }
                  },
                  child: Text(
                    "D. ${allQuestions[questionIndex].options[3]}",
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                    ),
                  )),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // setState(() {
            questionChange();
            // });
          },
          child: const Icon(Icons.forward),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text(
            "QuizApp",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w800, color: Colors.black),
          ),
          backgroundColor: Colors.grey[700],
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmoGE8pGXE4aUURpYIETqvw6W5RZB-iVvKdw&usqp=CAU",
                height: 200,
                width: 300,
              ),
            ),
            const Text(
              "Congratulations!!",
              style: TextStyle(color: Colors.orange, fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("You have sucessfully completed the quiz...🥳",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                )),
            const SizedBox(
              height: 20,
            ),
            Text(
              " Score :$noOfCorrectAnswer/${allQuestions.length}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  selectedIndex = -1;
                  questionIndex = 0;
                  startedQuiz = false;
                  questionScreen = true;
                  noOfCorrectAnswer = 0;
                  setState(() {});
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Colors.grey[700]), // Set color to grey
                ),
                child: const Text("Reset"))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
