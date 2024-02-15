import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: QuizApp());
  }
}

class QuizApp extends StatefulWidget {
  QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State {
  bool isQuestion = true;
  int queindex = 0;
  int selectedansIndex = -1;
  int correct = 0;

  List<Map> allQuestion = [
    {
      "question": "Who is the founder of Microsoft",
      "options": ["Bill gates", "Steve jobs", "Elon Musk ", "Joef bezos"],
      "answer index": 0,
    },
    {
      "question": "Who is the founder of Apple",
      "options": ["Bill gates", "Steve jobs", "Elon Musk ", "Joef bezos"],
      "answer index": 1,
    },
    {
      "question": "Who is the founder of Amazon",
      "options": ["Bill gates", "Steve jobs", "Elon Musk ", "Joef bezos"],
      "answer index": 3,
    },
    {
      "question": "Who is the founder of Tesla",
      "options": ["Bill gates", "Steve jobs", "Elon Musk ", "Joef bezos"],
      "answer index": 2,
    },
    {
      "question": "Who is the founder of Google",
      "options": ["Bill gates", "Steve jobs", "Elon Musk ", "Lary Page"],
      "answer index": 3,
    }
  ];
  MaterialStateProperty<Color?> correctans(int optionIndex) {
    if (selectedansIndex != -1) {
      if (optionIndex == allQuestion[queindex]["answer index"]) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (optionIndex == selectedansIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  void nextQue() {
    if (queindex < allQuestion.length - 1) {
      if (selectedansIndex == -1) {
        return;
      } else {
        if (selectedansIndex == allQuestion[queindex]["answer index"]) {
          correct++;
        }

        setState(() {
          selectedansIndex = -1;
          queindex++;
        });
      }
    } else {
      setState(() {
        isQuestion = false;
      });
    }
  }

  Scaffold isQuestionScreen() {
    if (isQuestion == true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Question : ",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text("${queindex + 1}/${allQuestion.length}"),
            ]),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 230,
              child: Text("${allQuestion[queindex]["question"]}"),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: correctans(0)),
              onPressed: () {
                setState(() {
                  selectedansIndex = 0;
                });
              },
              child: Text("A.${allQuestion[queindex]["options"][0]}"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: correctans(1)),
              onPressed: () {
                setState(() {
                  selectedansIndex = 1;
                });
              },
              child: Text("B.${allQuestion[queindex]["options"][1]}"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: correctans(2)),
              onPressed: () {
                setState(() {
                  selectedansIndex = 2;
                });
              },
              child: Text("C.${allQuestion[queindex]["options"][2]}"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: correctans(3)),
              onPressed: () {
                setState(() {
                  selectedansIndex = 3;
                });
              },
              child: Text("D.${allQuestion[queindex]["options"][3]}"),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            nextQue();
          },
          child: const Icon(Icons.forward),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz app",
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmoGE8pGXE4aUURpYIETqvw6W5RZB-iVvKdw&usqp=CAU",
              height: 400,
              width: 300,
            ),
            const Text(
              "Congratulations!!",
              style: TextStyle(color: Colors.orange),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("You sucessful completed the quiz",
                style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 20,
            ),
            Text(" Score :$correct/${allQuestion.length}"),
            ElevatedButton(
                onPressed: () {
                  selectedansIndex = -1;
                  queindex = 0;
                  isQuestion = true;
                  correct = 0;
                  setState(() {});
                },
                child: Text("Reset"))
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
