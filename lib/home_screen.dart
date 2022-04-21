import 'package:covapp_alpha/components/result.dart';
import 'package:covapp_alpha/quiz_page.dart';
import 'package:covapp_alpha/validador.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'controllers/question_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Validador()));
            },
            child: const Text('Valida'),
          ),
          FlatButton(
            onPressed: () {},
            child: const Text('Escanea'),
          )
        ],
      ),
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/backgrounds/home.svg",
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _controller.numControl,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Result(resultadoQuiz: _controller.numOfCorrectAns),
                    /*Container(
                      width: 250,
                      height: 250,
                      child: SvgPicture.asset(
                        "assets/items/covSVG.svg",
                        fit: BoxFit.scaleDown,
                        color: Colors.blueGrey,
                      ),
                    ),*/
                    Spacer(),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Respeta tu color de contagio",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    CupertinoButton.filled(
                        child: const Text("Realizar Cuestionario"),
                        onPressed: () {
                          _controller.reboot();
                          //route to a new page
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuizPage(),
                              ));
                        }),
                    Spacer(),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
