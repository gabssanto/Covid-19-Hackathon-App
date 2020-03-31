import 'package:mobx/mobx.dart';
part 'handleQuestions.g.dart';

class HandleQuestions = _HandleQuestionsBase with _$HandleQuestions;

abstract class _HandleQuestionsBase with Store {
  @observable
  double height = 80.00;

  @observable
  List yesNo = new List();

  @observable
  List questions = new List();

  @action
  void setQuestions(index, value) {
    this.questions[index] = value;
    //this.questions.add(question);
  }

  @action
  void setLastQuestion(index, value, limit) {
    if(questions.length > limit) {
      for(int i = index+1; i < questions.length; i++) {
        questions.removeAt(i);
      }
    }
    this.questions[index] = value;
    //this.questions.add(question);
  }

  @action
  void clearQuestions() {
    if(this.questions.isNotEmpty) {
      this.questions.clear();
    }
  }
}
