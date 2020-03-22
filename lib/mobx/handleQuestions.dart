import 'package:mobx/mobx.dart';
part 'handleQuestions.g.dart';

class HandleQuestions = _HandleQuestionsBase with _$HandleQuestions;

abstract class _HandleQuestionsBase with Store {
  @observable
  double height = 80.00;

  @observable
  bool question1;

  @action
  void setHeight(height) {
    this.height = height;
  }
}
