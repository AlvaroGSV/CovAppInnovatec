import 'package:covapp_alpha/components/opcion.dart';
import 'package:covapp_alpha/controllers/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/questions.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color.fromARGB(143, 244, 242, 227),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Text(
            question.question,
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: Color.fromARGB(255, 24, 31, 44),
                ),
          ),
          SizedBox(
            height: 25,
          ),
          ...List.generate(
              question.answers.length,
              (index) => Opcion(
                    text: question.answers[index],
                    index: index,
                    press: () => _controller.checkAns(question, index),
                  )),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
