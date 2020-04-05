import 'package:flutter/material.dart';
import 'package:covid19/pages/home/home_page.dart';

class YellowDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
      child: Container(
        width: MediaQuery.of(context).size.width - 80,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("ATENÇÃO",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  letterSpacing: -0.176,
                )),
            Text("Você é um caso suspeito",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color(0xfff6ab5f),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  letterSpacing: -0.176,
                )),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                  "Se seus sintomas são leves é orientado que permaneça em isolamento residencial e somente procure ajuda médica se houver agravamento dos sintomas. Em caso de dúvidas, ligue para o Dique Saúde 136 do Ministério da Saúde.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    letterSpacing: -0.154,
                  )),
            ),
            Container(
              width: 285,
              height: 49,
              decoration: new BoxDecoration(
                  color: Color(0xfff6b16c),
                  borderRadius: BorderRadius.circular(14)),
              child: FlatButton(
                onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => HomePage()));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Fechar",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          letterSpacing: -0.165,
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
