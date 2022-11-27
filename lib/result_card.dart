import 'dart:math';

class ResultCard {
  int _height;
  int _weight;
  String _result;
  double _value;
  String _message;

  ResultCard(this._height, this._weight);

  void assignText() {
    if (_value >= 25) {
      _result = "Overweight";
      _message = "Try to reduce your diet!";
    } else if (_value >= 20) {
      _result = "Normal";
      _message = "Nothing to change!";
    } else {
      _result = "Underweight";
      _message = "You can safely increase your diet!";
    }
  }

  double getValue() {
    _value = _weight / pow(_height / 100, 2);
    assignText();
    return _value;
  }

  String getMessage() {
    return _message;
  }

  String getResult() {
    return _result;
  }
}
