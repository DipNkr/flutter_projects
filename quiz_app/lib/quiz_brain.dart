import 'questions.dart';

class QuizBrain {
  int _qNum = 0;
  final List<Questions> _questionbank = [
    Questions(
        "Bitcoin is a cryptocurrency, which is an application of Blockchain ?",
        true),
    Questions(
        "A blockchain doesn't enables peer-to-peer transfer of digital currency without any intermediaries such as banks ?",
        false),
    Questions("Bitcoin is a solution to the double-spend problem?", true),
  ];

  void nextQues() {
    if (_qNum < _questionbank.length - 1) {
      _qNum++;
    }
  }

  String getQuestiom() {
    return _questionbank[_qNum].question;
  }

  bool getAns() {
    return _questionbank[_qNum].answer;
  }

  bool isFinished() {
    if (_qNum == _questionbank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _qNum = 0;
  }
}
