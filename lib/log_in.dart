import 'package:covapp_alpha/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'controllers/question_controller.dart';

class LogIn extends StatelessWidget {
  LogIn({Key? key}) : super(key: key);

  TextEditingController _NumControl = TextEditingController();
  String Banner = "N° de control";
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      body: Stack(children: [
        SvgPicture.asset(
          "assets/backgrounds/logIn.svg",
          fit: BoxFit.fill,
        ),
        SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Spacer(flex: 2),
                  Text(
                    "Ingrese su numero de control",
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                        color: Color.fromARGB(210, 41, 57, 85),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Asegurese de que sea el mismo que esta en su credencial",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Color.fromARGB(210, 41, 57, 85),
                        fontWeight: FontWeight.normal),
                  ),
                  Spacer(flex: 1),
                  //TO-DO
                  //Falta cambiar el olor y hacer que sea a lo largo
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _NumControl,
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(180, 255, 255, 255),
                      filled: true,
                      hintText: Banner,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(13))),
                    ),
                  ),
                  Spacer(flex: 1),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: CupertinoButton.filled(
                        child: const Text('INICIA'),
                        onPressed: () {
                          if (_NumControl.text != "") {
                            print(_NumControl);
                            //route to a new page
                            _controller.getNumControl(_NumControl.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ));
                          } else if (_NumControl.text == "") {
                            Banner = "INGRESE SU NUMERO DE CONTROL";
                          }
                        }),
                  ),
                  Spacer(flex: 1),
                ],
              )),
        )
      ]),
    );
  }
}
