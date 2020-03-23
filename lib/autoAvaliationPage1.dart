import 'dart:async';
import 'dart:io';

import 'package:covid19/global/generalAppBar.dart';
import 'package:covid19/mobx/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:json_to_form/json_schema.dart';
import 'dart:convert';

class AutoAvaliationPage1 extends StatefulWidget {
  @override
  _AutoAvaliationPage1State createState() => _AutoAvaliationPage1State();
}

class  _AutoAvaliationPage1State extends State<AutoAvaliationPage1> {
  String form = json.encode({
    'autoValidated': false,
    'fields': [
      {
        'key': 'question',
        'type': 'RadioButton',
        'label': 'Você já teve diagnóstico de coronavírus?',
        'value': 3,
        'items': [
          {
            'label': "Sim",
            'value': 1,
          },
          {
            'label': "Não",
            'value': 2,
          },
        ]
      },
      {
        'key': 'question',
        'type': 'Input',
        'label': 'Quando foi diagnosticado?',
        'value':'',
        'required': true
      },
      {
        'key': 'question',
        'type': 'RadioButton',
        'label': 'Você é um caso suspeito de coronavírus?',
        'value': 3,
        'items': [
          {
            'label': "Sim",
            'value': 1,
          },
          {
            'label': "Não",
            'value': 2,
          },
        ]
      },
      {
        'key': 'question',
        'type': 'RadioButton',
        'label': 'Está em isolamento residencial ou internamento?',
        'value': 3,
        'items': [
          {
            'label': "Sim",
            'value': 1,
          },
          {
            'label': "Não",
            'value': 2,
          },
        ]
      },
      {
        'key': 'question',
        'type': 'Input',
        'label': 'Quando começou a sentir os sintomas?',
        'value':'',
        'required': true
      },
      {
        'key': 'check',
        'type': 'Checkbox',
        'label': 'Quais são os seus sintomas?',
        'value': 2,
        'items': [
          {
            'label': "Febre",
            'value': false,
          },
          {
            'label': "Tosse",
            'value': false,
          },
          {
            'label': "Escarro",
            'value': false,
          },
          {
            'label': "Congestão Nasal",
            'value': false,
          },
          {
            'label': "Corrimento Nasal",
            'value': false,
          },
        ]
      },
      {
        'key': 'question',
        'type': 'RadioButton',
        'label': 'Apresenta dificuldade para respirar?',
        'value': 3,
        'items': [
          {
            'label': "Sim",
            'value': 1,
          },
          {
            'label': "Não",
            'value': 2,
          },
        ]
      },
      {
        'key': 'question',
        'type': 'RadioButton',
        'label': 'Os olhos estão vermelhos e/ou com secreção?',
        'value': 3,
        'items': [
          {
            'label': "Sim",
            'value': 1,
          },
          {
            'label': "Não",
            'value': 2,
          },
        ]
      },
      {
        'key': 'question',
        'type': 'RadioButton',
        'label': 'Tem dificuldade para engolir os alimentos?',
        'value': 3,
        'items': [
          {
            'label': "Sim",
            'value': 1,
          },
          {
            'label': "Não",
            'value': 2,
          },
        ]
      },
      {
        'key': 'question',
        'type': 'RadioButton',
        'label': 'Tem observado se a ponta de seus dedos dos pés ou das mãos estão ficando descorados ou azulados?',
        'value': 3,
        'items': [
          {
            'label': "Sim",
            'value': 1,
          },
          {
            'label': "Não",
            'value': 2,
          },
        ]
      },
      {
        'key': 'question',
        'type': 'RadioButton',
        'label': 'Notou ter batimento de asa do nariz?',
        'value': 3,
        'items': [
          {
            'label': "Sim",
            'value': 1,
          },
          {
            'label': "Não",
            'value': 2,
          },
        ]
      },
    ]
  });
  dynamic response;

  Map decorations = {
  };

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: GeneralAppBar(
        title: 'Autoavaliação',
      ),
      body: new SingleChildScrollView(
        child: new Center(
          child: new Column(children: <Widget>[
            new JsonSchema(
//              decorations: decorations,
              form: form,
              onChanged: (dynamic response) {
                this.response = response;
              },
              actionSave: (data) {
                print(data);
              },
              buttonSave: new Container(
                height: 40.0,
                color: Color(0xff27b3ff),
                child: Center(
                  child: Text("Confirmar",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}