import 'package:covapp_alpha/controllers/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.resultadoQuiz}) : super(key: key);

  final int resultadoQuiz;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (qnController) {
        Color getColorResult() {
          if (qnController.isEnded() == true) {
            if (resultadoQuiz >= 8) {
              return Color.fromARGB(255, 255, 115, 115);
            } else if (resultadoQuiz > 3 && resultadoQuiz < 8) {
              return Color.fromARGB(255, 185, 185, 25);
            } else if (resultadoQuiz <= 3) {
              return Color.fromARGB(255, 11, 198, 52);
            }
          }
          return Colors.blueGrey;
        }

        return Container(
          width: 250,
          height: 250,
          child: SvgPicture.asset(
            "assets/items/covSVG.svg",
            fit: BoxFit.scaleDown,
            color: getColorResult(),
          ),
        );
      },
    );
  }
}
