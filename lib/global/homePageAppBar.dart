import 'package:covid19/autoAvaliationPage1.dart';
import 'package:covid19/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  final Function onPressed;
  final Function onTitleTapped;

  @override
  final Size preferredSize;
  HomePageAppBar(
      {@required this.title,
      @required this.child,
      @required this.onPressed,
      this.onTitleTapped})
      : preferredSize = Size.fromHeight(323.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: ClipOval(
                    child: Material(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Color.fromRGBO(1, 1, 1, 0),
                        child: Icon(Icons.notifications, size: 60, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ClipOval(
                    child: Material(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Color.fromRGBO(1, 1, 1, 0),
                        child: Icon(Icons.account_circle, size: 60, color: Colors.blue),
                        onTap: () {
                          Navigator.push(
                          context, MaterialPageRoute(builder: (context) => ProfilePage()));
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding:
                    EdgeInsets.only(top: 20, left: 0, right: 40, bottom: 10),
                child: Text("Olá Gabriel,\nComo está se sentindo hoje?",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xff27b3ff),
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      letterSpacing: -0.231,
                    )),
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              width: 313,
              height: 42,
              decoration: BoxDecoration(
                  color: Color(0xFF64f460),
                  borderRadius: BorderRadius.circular(13)),
            child: FlatButton(
              onPressed: () {
                showDialog(
                    context: context,
                  builder: (BuildContext context) {
                      return GreenDialog();
                  }
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(Icons.sentiment_very_satisfied, size: 36, color: Colors.white,),
                  Text("Bem",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        letterSpacing: -0.231,
                      )
                  ),
                  Icon(Icons.sentiment_very_satisfied, size: 36, color: Color(0x0064f460),),


                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              width: 313,
              height: 42,
              decoration: BoxDecoration(
                  color: Color(0xFFf65f68),
                  borderRadius: BorderRadius.circular(13)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => AutoAvaliationPage1()));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.sentiment_very_dissatisfied, size: 36, color: Colors.white,),
                    Text("Mal",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          letterSpacing: -0.231,
                        )
                    ),
                    Icon(Icons.sentiment_very_satisfied, size: 36, color: Color(0x00f65f68),),
                  ],
                ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: 40, right: 40),
            child: Text(
                "Recomendamos que no período de quarentena evite sair de casa, caso saia, fique a uma distância de 2 metros de cada pessoa.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color(0xff6f6f6f),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  letterSpacing: -0.154,
                )),
          ),
          /* Container(
              margin: EdgeInsets.only(top: 10),
              width: 312,
              height: 34,
              decoration: new BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff27b3ff), width: 1),
                  borderRadius: BorderRadius.circular(13)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Veja mais dicas",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xff27b3ff),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        letterSpacing: -0.176,
                      )),
                ],
              )) */
        ],
      ),
    );
  }
}

class GreenDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(21)
      ),
      child: Container(
        width: MediaQuery.of(context).size.width - 80,
        height: MediaQuery.of(context).size.height - 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              child: Icon(Icons.sentiment_very_satisfied, size: 60, color: Color(0xFF64f460),),
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

                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: RichText(
                  text: new TextSpan(
                      children: [

                        new TextSpan(
                            text: "-Mantenha a higiene das mãos. Lave sempre que possível com água e sabão ou use álcool gel 70%.\n\n-Higiene respiratória é fundamental. Ao espirrar e tossir use um lenço descartável e jogue fora imediatamente. Se você não tem lenço descartável, a melhor forma de é espirrar e tossir na dobra do cotovelo.\n\n",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              letterSpacing: -0.154,

                            )
                        ),
                        new TextSpan(
                            text: "NUNCA ESPIRRE OU TUSSA NAS MÃOS",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xff292727),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              letterSpacing: -0.154,

                            )
                        ),
                        new TextSpan(
                            text: ".\n\n",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xff292727),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              letterSpacing: -0.154,

                            )
                        ),
                        new TextSpan(
                            text: "-Evite aglomerações.\n\n-Se possível, fique em casa.\n\n-Não compartilhe objetos pessoais\n\n-Somente procure ajuda médica se houver agravamento dos sintomas.\n\n-Em caso de dúvidas, ligue para o Dique Saúde 136 do Ministério da Saúde.",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              letterSpacing: -0.154,

                            )
                        ),
                      ]
                  )
              ),
            ),
            Container(
                width: 285,
                height: 49,
                decoration: new BoxDecoration(
                    color: Color(0xFF64f460),
                    borderRadius: BorderRadius.circular(14)
                ),
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

                          )
                      ),
                    ],
                  ),
                )
            )

          ],
        ),
      ),
    );
  }
}
