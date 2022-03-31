import 'package:flutter/material.dart';
import '../constants.dart';

class BMIInformation extends StatefulWidget {
  final double bmiValue;
  final Color color;
  const BMIInformation({
    Key? key,
    required this.bmiValue,
    required this.color,
  }) : super(key: key);

  @override
  State<BMIInformation> createState() => _BMIInformationState();
}

class _BMIInformationState extends State<BMIInformation> {
  getWidget() {
    if (widget.bmiValue < 18.5) {
      return const Text(
        "Underweight",
        style: kPickerLabelStyle,
      );
    } else if (widget.bmiValue < 24.9) {
      return const Text(
        "Normal",
        style: kPickerLabelStyle,
      );
    } else if (widget.bmiValue < 29.9) {
      return const Text(
        "Overweight",
        style: kPickerLabelStyle,
      );
    } else if (widget.bmiValue < 34.9) {
      return const Text(
        "Obese",
        style: kPickerLabelStyle,
      );
    } else {
      return const Text(
        "Extremely obese",
        style: kPickerLabelStyle,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF0A0E21),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0A0E21),
          automaticallyImplyLeading: true,
          title: const Text("BMI Calculator"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Center(
                child: Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(100.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1D1E33),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('BMI', style: kPickerLabelStyle),
                        Text(widget.bmiValue.toString(),
                            style: TextStyle(
                              fontSize: 30.0,
                              color: widget.color,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2,
                            )),
                      ],
                    )),
              ),
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: getWidget(),
              ),
            ),
          ],
        ));
  }
}
