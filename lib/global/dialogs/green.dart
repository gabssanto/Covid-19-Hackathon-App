import 'package:flutter/material.dart';

class GreenDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
      child: Container(
        width: MediaQuery.of(context).size.width - 80,
        height: MediaQuery.of(context).size.height - 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              child: Icon(
                Icons.sentiment_very_satisfied,
                size: 60,
                color: Color(0xFF64f460),
              ),
            ),
            Container(
              child: Text("Obrigado pela informação \n",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    letterSpacing: -0.176,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: RichText(
                  text: new TextSpan(children: [
                new TextSpan(
                    text:
                        "-Mantenha a higiene das mãos. Lave sempre que possível com água e sabão ou use álcool gel 70%.\n\n-Higiene respiratória é fundamental. Ao espirrar e tossir use um lenço descartável e jogue fora imediatamente. Se você não tem lenço descartável, a melhor forma de é espirrar e tossir na dobra do cotovelo.\n\n",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      letterSpacing: -0.154,
                    )),
                new TextSpan(
                    text: "NUNCA ESPIRRE OU TUSSA NAS MÃOS",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xff292727),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      letterSpacing: -0.154,
                    )),
                new TextSpan(
                    text: ".\n\n",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xff292727),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      letterSpacing: -0.154,
                    )),
                new TextSpan(
                    text:
                        "-Evite aglomerações.\n\n-Se possível, fique em casa.\n\n-Não compartilhe objetos pessoais\n\n-Somente procure ajuda médica se houver agravamento dos sintomas.\n\n-Em caso de dúvidas, ligue para o Dique Saúde 136 do Ministério da Saúde.",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      letterSpacing: -0.154,
                    )),
              ])),
            ),
            Container(
                width: 285,
                height: 49,
                decoration: new BoxDecoration(
                    color: Color(0xFF64f460),
                    borderRadius: BorderRadius.circular(14)),
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                ))
          ],
        ),
      ),
    );
  }
}
