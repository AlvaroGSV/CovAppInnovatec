import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Validador extends StatelessWidget {
  Validador({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        SvgPicture.asset(
          "assets/backgrounds/home.svg",
          fit: BoxFit.fill,
        ),
        Text("Aqui se validara si es un estudiante")
      ]),
    );
  }
}
