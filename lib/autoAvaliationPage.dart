import 'package:covid19/global/generalAppBar.dart';
import 'package:flutter/material.dart';

class AutoAvaliationPage extends StatelessWidget {
  final _height = 200.00;

  Duration _duration = new Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(title: 'Autoavaliação',),
      body: Container(
        color: Color(0xFFe8e8e8),
        child: Column(
          children: <Widget>[
            AnimatedContainer(
              height: _height,
              duration: _duration,
              child: Text("Você já teve diagnóstico de coronavírus?",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.black38,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    letterSpacing: -0.154,

                  )
              )
              ,

            )
          ],
        ),
      ),
    );
  }
}
