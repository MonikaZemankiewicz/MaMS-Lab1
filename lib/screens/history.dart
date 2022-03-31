import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<String> history = ["Nothing to show yet"];

  @override
  void initState() {
    super.initState();
    _showHistory();
  }

  _showHistory() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      history = prefs.getStringList('history') ?? [];
      if (history.length > 10) {
        history = history.sublist(history.length - 10).reversed.toList();
      }
    });
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
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.builder(
              itemCount: history.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text((index + 1).toString()),
                    backgroundColor: kLighPurpleColor,
                  ),
                  title: Text(history[index], style: kPickerLabelStyle),
                );
              }),
        ));
  }
}
