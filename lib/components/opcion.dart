import 'package:covapp_alpha/controllers/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Opcion extends StatelessWidget {
  const Opcion({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (qnController) {
        Color getCorretColor() {
          if (qnController.isAnswered) {
            if (index == qnController.correctAns) {
              return Color.fromARGB(255, 11, 198, 52);
            } else if (index == qnController.selectedAns &&
                qnController.selectedAns != qnController.correctAns) {
              return Color.fromARGB(255, 255, 115, 115);
            }
          }
          return Color.fromARGB(114, 111, 110, 109);
        }

        IconData getTheCorrectIcon() {
          return getCorretColor() == Color.fromARGB(255, 255, 115, 115)
              ? Icons.close
              : Icons.done;
        }

        return InkWell(
          onTap: press,
          child: Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: getCorretColor()),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${index + 1} $text",
                  style: TextStyle(
                      //Color.fromARGB(255, 24, 31, 44)
                      color: getCorretColor(),
                      fontSize: 18),
                ),
                Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                      color:
                          getCorretColor() == Color.fromARGB(114, 111, 110, 109)
                              ? Colors.transparent
                              : getCorretColor(),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: getCorretColor())),
                  child: getCorretColor() == Color.fromARGB(113, 212, 208, 205)
                      ? null
                      : Icon(
                          getTheCorrectIcon(),
                          size: 20,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
