import 'package:covapp_alpha/components/question_card.dart';
import 'package:covapp_alpha/controllers/question_controller.dart';
import 'package:covapp_alpha/models/questions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        SvgPicture.asset(
          "assets/backgrounds/quiz.svg",
          fit: BoxFit.fill,
        ),
        SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Obx(
                () => Text.rich(
                  TextSpan(
                      text:
                          "Question ${_questionController.questionNumber.value}",
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                            color: Color.fromARGB(210, 41, 57, 85),
                          ),
                      children: [
                        TextSpan(
                          text: "/${_questionController.preguntas.length}",
                          style:
                              Theme.of(context).textTheme.headline4?.copyWith(
                                    color: Color.fromARGB(210, 41, 57, 85),
                                  ),
                        )
                      ]),
                ),
              ),
            ),
            Divider(
              thickness: 2.6,
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: _questionController.pageController,
                onPageChanged: _questionController.updateQuestionNumbers,
                itemCount: _questionController.preguntas.length,
                itemBuilder: (context, index) => QuestionCard(
                  question: _questionController.preguntas[index],
                ),
              ),
            )
          ],
        ))
      ],
    );
  }
}
