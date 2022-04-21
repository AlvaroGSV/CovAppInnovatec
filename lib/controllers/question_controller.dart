import 'package:covapp_alpha/controllers/score.dart';
import 'package:covapp_alpha/home_screen.dart';
import 'package:covapp_alpha/models/questions.dart';
import 'package:covapp_alpha/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  PageController _pageController = PageController();
  PageController get pageController => this._pageController;

  final List<Question> _questions = sampleData
      .map(
        (questions) => Question(
            id: questions['id'],
            question: questions['question'],
            answers: questions['answers'],
            danger: questions['danger']),
      )
      .toList();
  List<Question> get preguntas => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAns;
  int get correctAns => this._correctAns;

  late int _selectedAns;
  int get selectedAns => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  late int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  String _numControl = "";
  String get numControl => this._numControl;

  void reboot() {
    _isAnswered = false;
    _correctAns = 0;
    _selectedAns = 0;
    _questionNumber = 1.obs;
    _numOfCorrectAns = 0;
  }

  void getNumControl(String nControl) {
    _numControl = nControl;
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.danger;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    update();

    Future.delayed(Duration(seconds: 2), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
    } else {
      Get.to(HomeScreen());
    }
  }

  void updateQuestionNumbers(int index) {
    _questionNumber.value = index + 1;
  }

  bool isEnded() {
    if (_questionNumber.value == _questions.length) {
      return true;
    } else {
      return false;
    }
  }
}
