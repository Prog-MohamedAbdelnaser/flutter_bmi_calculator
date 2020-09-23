import 'dart:math';

class CalculateBrain {
  final int weight;
  final int height;

  double _bmi;
  CalculateBrain(this.weight, this.height);

  void calculateResult() {
    _bmi = weight / (pow(height / 100, 2));
  }

  String getBMI() => _bmi.toStringAsFixed(1);

  String getResult() {
    if (_bmi >= 25) {
      return 'Over Weight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Under Weight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Over Weight';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight . Good job !';
    } else {
      return 'Under Weight';
    }
  }
}
