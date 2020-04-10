import 'package:mobx/mobx.dart';
import 'dart:convert';

part 'handleQuestions.g.dart';

class HandleQuestions = _HandleQuestionsBase with _$HandleQuestions;

abstract class _HandleQuestionsBase with Store {
  @observable
  double height = 80.00;

  @observable
  var opacity;

  @observable
  List yesNo = new List();

  @observable
  List questions = new List();

  @observable
  int typeForm = 0;

  @action
  void setQuestions(index, value) {
    this.questions[index] = value;
    //this.questions.add(question);
  }

  @action
  void setLastQuestion(index, value, limit) {
    //if(questions.length > limit) {
    //  for(int i = index+1; i < questions.length; i++) {
    //    questions.removeAt(i);
    //  }
    //}
    this.questions[index] = value;
    //this.questions.add(question);
  }

  @action
  void clearQuestions() {
    if (this.questions.isNotEmpty) {
      this.questions.clear();
    }
  }

  @action
  void setForm(List questions) {
    this.questions = questions;
  }

  Map<String, dynamic> toJson() {
    bool toBoolean(int val) {
      if (val == 1) {
        return true;
      } else if (val == 0) {
        return false;
      }
      return true;
    }

    if (typeForm == 1) {
      return {
        'typeform': typeForm,
        'questao1': {
          'pergunta': 'Você já teve diagnóstico de coronavírus?',
          'resposta': toBoolean(questions[0])
        },
        'questao2': {
          'pergunta': 'Quando foi diagnosticado?',
          'resposta': questions[1],
        },
        'questao3': {
          'pergunta': 'Está em isolamento residencial ou internamento?',
          'resposta': toBoolean(questions[2])
        },
      };
    }
    else if (typeForm == 2) {
      return {
        'typeform': typeForm,
        'questao1': {
          'pergunta': 'Você já teve diagnóstico de coronavírus?',
          'resposta': toBoolean(questions[0])
        },
        'questao2': {
          'pergunta': 'Você é um caso suspeito de coronavírus?',
          'resposta': toBoolean(questions[1])
        },
        'questao3': {
          'pergunta': 'Está em isolamento residencial ou internamento?',
          'resposta': toBoolean(questions[2])
        },
      };
    }
    else if (typeForm == 3) {
      return {
        'typeform': typeForm,
        'questao1': {
          'pergunta': 'Você já teve diagnóstico de coronavírus?',
          'resposta': toBoolean(questions[0])
        },
        'questao2': {
          'pergunta': 'Você é um caso suspeito de coronavírus?',
          'resposta': toBoolean(questions[1])
        },
        'questao3': {
          'pergunta': 'Está em isolamento residencial ou internamento?',
          'resposta': toBoolean(questions[2])
        },
        'questao4': {
          'pergunta': 'Quando começou a sentir os sintomas?',
          'resposta': questions[3],
        },
        'questao5': {
          'pergunta': 'Quais são os seus sintomas?',
          'resposta': {
            'febre': toBoolean(questions[4][0]),
            'tosse': toBoolean(questions[4][1]),
            'escarro': toBoolean(questions[4][2]),
            'congestão_nasal': toBoolean(questions[4][3]),
            'corrimento_nasal': toBoolean(questions[4][4]),
          }
        },
        'questao6': {
          'pergunta': 'Apresenta dificuldade para respirar?',
          'resposta': questions[5],
        },
        'questao7': {
          'pergunta': 'Os olhos estão vermelhos e/ou com secreção?',
          'resposta': questions[6],
        },
        'questao8': {
          'pergunta': 'Tem dificuldade para engolir os alimentos?',
          'resposta': questions[7],
        },
        'questao9': {
          'pergunta': 'Tem observado se a ponta de seus dedos dos pés ou das mãos estão ficando descorados ou azulados?',
          'resposta': questions[8],
        },
        'questao10': {
          'pergunta': 'Notou ter batimento de asa do nariz?',
          'resposta': questions[9],
        },
        'questao11': {
          'pergunta': 'Teve contato com pessoa que, nos últimos 14 dias, era caso suspeito ou confirmado para COVID-19?',
          'resposta': questions[10],
        },
      };
    }
  }
}
