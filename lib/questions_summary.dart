import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: summaryData.map((data) {
            var badgeColor = (data['user_answer'] == data['correct_answer'])
                      ? Colors.lightBlueAccent
                      : Colors.red;
            return Row(children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: badgeColor,
                ),
                padding: const EdgeInsets.all(10),
                child: Text(((data['question_index'] as int) + 1).toString()),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['question'] as String,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      data['user_answer'] as String,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 201, 153, 251),
                      ),
                    ),
                    Text(
                      data['correct_answer'] as String,
                      style: const TextStyle(color: Colors.lightBlueAccent),
                    ),
                  ],
                ),
              ),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
