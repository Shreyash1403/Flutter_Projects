import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State createState() => _AppState();
}

class SingleQuestionModel {
  final String? question;
  final List<String>? options;
  final int? answerIndex;

  const SingleQuestionModel({this.question, this.options, this.answerIndex});
}

class _AppState extends State {
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
            "What is the purpose of the 'pubspec.yaml' file in a Flutter project?",
        options: [
          "To store project images",
          "To declare project dependencies",
          " To define project colors",
          "To write project documentation"
        ],
        answerIndex: 1),
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

  bool questionScreen = true;
  int questionIndex = 0;
  int selectedAnswerIndex = -1;
  int correctAnswer = 0;

  MaterialStateProperty<Color?> changeColor(boxButton) {
    if (selectedAnswerIndex != -1) {
      if (boxButton == allQuestions[questionIndex].answerIndex) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (boxButton == selectedAnswerIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  void nextQuestion() {
    // if (selectedAnswerIndex == -1) {
    //   return;
    // }

    if (selectedAnswerIndex == allQuestions[questionIndex].answerIndex) {
      correctAnswer++;
    }
    if (selectedAnswerIndex != -1) {
      if (questionIndex == allQuestions.length - 1) {
        questionScreen = false;
      }
      setState(() {
        questionIndex++;
        selectedAnswerIndex = -1;
      });
    }
  }

  Scaffold isQuestionScreen() {
    if (questionScreen == true) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("APP"),
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Question:${questionIndex + 1}/${allQuestions.length}")
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 60,
                child: Text(
                  allQuestions[questionIndex].question,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                height: 40,
                child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: changeColor(0)),
                    onPressed: () {
                      if (selectedAnswerIndex == -1) {
                        setState(() {
                          selectedAnswerIndex = 0;
                        });
                      }
                    },
                    child:
                        Text("A. ${allQuestions[questionIndex].options[0]}")),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                height: 40,
                child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: changeColor(1)),
                    onPressed: () {
                      if (selectedAnswerIndex == -1) {
                        setState(() {
                          selectedAnswerIndex = 1;
                        });
                      }
                    },
                    child:
                        Text("B. ${allQuestions[questionIndex].options[1]}")),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                height: 40,
                child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: changeColor(2)),
                    onPressed: () {
                      if (selectedAnswerIndex == -1) {
                        setState(() {
                          selectedAnswerIndex = 2;
                        });
                      }
                    },
                    child:
                        Text("C. ${allQuestions[questionIndex].options[2]}")),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                height: 40,
                child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: changeColor(3)),
                    onPressed: () {
                      if (selectedAnswerIndex == -1) {
                        setState(() {
                          selectedAnswerIndex = 3;
                        });
                      }
                    },
                    child:
                        Text("D. ${allQuestions[questionIndex].options[3]}")),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              nextQuestion();
            },
            child: const Icon(Icons.forward),
          ));
    } else {
      return const Scaffold();
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
