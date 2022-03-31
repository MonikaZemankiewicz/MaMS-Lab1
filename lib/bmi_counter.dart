import 'package:firstlab/screens/bmi_information.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BMICounter extends StatefulWidget {
  final bool isMetric;

  const BMICounter({
    Key? key,
    required this.isMetric,
  }) : super(key: key);

  @override
  State<BMICounter> createState() => _BMICounterState();
}

class _BMICounterState extends State<BMICounter> {
  int heightMetric = 180;
  int weightMetric = 70;
  int heightImperial = 71;
  int weightImperial = 155;
  double bmiIndex = 0.00;
  Color color = Colors.white;

  Future<void> calculateBMIMetric(int height, int weight) async {
    setState(() {
      bmiIndex = (weight / (height * height) * 10000);
    });

    setBMIColor();
    await addBMIValueToHistory();
  }

  Future<void> calculateBMIImperial(int height, int weight) async {
    setState(() {
      bmiIndex = ((weight * 703) / (height * height));
    });

    setBMIColor();
    await addBMIValueToHistory();
  }

  void setBMIColor() {
    if (bmiIndex < 18.5) {
      color = Colors.blue;
    } else if (bmiIndex < 24.9) {
      color = Colors.green;
    } else if (bmiIndex < 29.9) {
      color = Colors.yellow;
    } else if (bmiIndex < 34.9) {
      color = Colors.orange;
    } else {
      color = Colors.red;
    }
  }

  Future<void> addBMIValueToHistory() async {
    final prefs = await SharedPreferences.getInstance();
    var oldHistory = prefs.getStringList('history') ?? [];
    oldHistory.add(bmiIndex.toStringAsFixed(2));
    prefs.setStringList('history', oldHistory);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: const Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'HEIGHT',
                        style: kPickerLabelStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          widget.isMetric
                              ? heightMetric.toString()
                              : heightImperial.toString(),
                          style: kPickerValueStyle,
                        ),
                        widget.isMetric
                            ? const Text(
                                'cm',
                                style: kPickerLabelStyle,
                              )
                            : const Text(
                                'inches',
                                style: kPickerLabelStyle,
                              ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 30.0,
                        ),
                      ),
                      child: widget.isMetric
                          ? Slider(
                              value: heightMetric.toDouble(),
                              min: 40.0,
                              max: 220.0,
                              activeColor:
                                  const Color.fromARGB(255, 153, 111, 124),
                              onChanged: (double newValue) {
                                setState(() {
                                  heightMetric = newValue.round();
                                });
                              },
                            )
                          : Slider(
                              value: heightImperial.toDouble(),
                              min: 16.0,
                              max: 87.0,
                              activeColor:
                                  const Color.fromARGB(255, 153, 111, 124),
                              onChanged: (double newValue) {
                                setState(() {
                                  heightImperial = newValue.round();
                                });
                              },
                            ),
                    )
                  ])),
        ),
        Expanded(
          flex: 3,
          child: Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: const Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'MASS',
                        style: kPickerLabelStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          widget.isMetric
                              ? weightMetric.toString()
                              : weightImperial.toString(),
                          style: kPickerValueStyle,
                        ),
                        widget.isMetric
                            ? const Text(
                                'kg',
                                style: kPickerLabelStyle,
                              )
                            : const Text(
                                'lbs',
                                style: kPickerLabelStyle,
                              ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 30.0,
                        ),
                      ),
                      child: widget.isMetric
                          ? Slider(
                              value: weightMetric.toDouble(),
                              min: 30.0,
                              max: 200.0,
                              activeColor: kLighPurpleColor,
                              onChanged: (double newValue) {
                                setState(() {
                                  weightMetric = newValue.round();
                                });
                              },
                            )
                          : Slider(
                              value: weightImperial.toDouble(),
                              min: 66.0,
                              max: 440.0,
                              activeColor: kLighPurpleColor,
                              onChanged: (double newValue) {
                                setState(() {
                                  weightImperial = newValue.round();
                                });
                              },
                            ),
                    ),
                  ])),
        ),
        Expanded(
          flex: 5,
          child: Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BMIInformation(
                    bmiValue: bmiIndex,
                    color: color,
                  );
                }));
              },
              child: Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1D1E33),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('BMI', style: kPickerLabelStyle),
                      Text(bmiIndex.toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 30.0,
                            color: color,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                          )),
                    ],
                  )),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            widget.isMetric
                ? calculateBMIMetric(heightMetric, weightMetric)
                : calculateBMIImperial(heightImperial, weightImperial);
          },
          child: Container(
            color: kLighPurpleColor,
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80.0,
            alignment: Alignment.center,
            child: const Text("SUBMIT", style: kPickerValueStyle),
          ),
        )
      ],
    );
  }
}
