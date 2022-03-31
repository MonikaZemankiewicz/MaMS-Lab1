import 'package:flutter_test/flutter_test.dart';
import 'package:firstlab/bmi_counter.dart';

void main() {
  test("The value of the BMI should equal 24.", () {
    BMICounter bmiCounter = BMICounter(
      isMetric: true,
    );
  });
}
