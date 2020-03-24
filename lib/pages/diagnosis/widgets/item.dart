import 'package:covid19/pages/diagnosis/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiagnosisItem extends StatelessWidget {
  final sintomaTxt =
      "Se Seus sintomas são leves é orientado que permaneça em isolamento residencial e somente procure ajuda médica se houver agravamento dos sintomas.\nEm caso de dúvidas, ligue para o Dique Saúde 136 do Ministério da Saúde.";
  final instrucoesSaudeTxt =
      "- Evite aglomerações.\n- Se possível, fique em casa.\n- Não compartilhe objetos pessoais.\n- Somente procure ajuda médica se houver agravamento dos sintomas.\n- Em caso de dúvidas, ligue para o Dique Saúde 136 do Ministério da Saúde.";
  final diagnostico;
  final date;

  DiagnosisItem({this.diagnostico, this.date});

  factory DiagnosisItem.fromJson(Map<String, dynamic> json) {
    return DiagnosisItem(
      diagnostico: json['diagnosis'],
      date: json['diagnosis_date'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              'Respondido em\n${new DateFormat('dd/MM/yyyy').format(DateTime.parse(date))}',
              softWrap: true,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height / 6.5,
              width: MediaQuery.of(context).size.width / 3.7,
              child: Container(
                transform: Matrix4.translationValues(0.0, 40.0, 0.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.transparent,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            ConstantsDiagnosisPage.icones[diagnostico])),
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                ),
              )),
          Container(
            margin: EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Column(
              children: <Widget>[
                (() {
                  if (diagnostico > 0) {
                    return Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Text(
                            "ATENÇÃO",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black54,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              letterSpacing: -0.176,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(bottom: 25),
                            child: Text(
                              'Você é um caso ${diagnostico == 1 ? "suspeito" : "confirmado"}',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: diagnostico == 1
                                    ? Color(0xfff6b16c)
                                    : Color(0xfff65f68),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                letterSpacing: -0.176,
                              ),
                              textAlign: TextAlign.center,
                            )),
                      ],
                    );
                  }
                  return Container(
                      padding: EdgeInsets.only(bottom: 25),
                      child: Text(
                        'Você está saudável',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0xff64f460),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          letterSpacing: -0.176,
                        ),
                        textAlign: TextAlign.center,
                      ));
                })(),
                Text(
                  diagnostico == 0 ? instrucoesSaudeTxt : sintomaTxt,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.black54,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    letterSpacing: -0.154,
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
