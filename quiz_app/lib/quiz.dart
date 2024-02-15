import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int queCount = 1;
  int index = 0;

  void counter() {
    if (queCount < 10 && index < questionList.length - 1) {
      queCount++;
      index++;
    }
  }

  List<String> questionList = [
    "Who is your favorite player?",
    "Who is your favorite player1?",
    "Who is your favorite player2?",
    "Which is your favorite team?"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                child: Text("Question:"),
              ),
              SizedBox(
                child: Text("$queCount/10"),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            child: Text("${questionList[index]}"),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("A. Virat Kohli"),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("B. Rohit Sharma"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: const Text("C. Surya"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: const Text("D. MS Dhoni"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter();
          });
        },
        child: const Text("Next"),
      ),
    );
  }
}
