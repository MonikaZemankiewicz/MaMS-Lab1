import 'package:flutter/material.dart';
import 'bmi_counter.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'screens/history.dart';
import 'screens/about_author.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isMetric = true;

  void changeMetric(bool value) {
    setState(() {
      _isMetric = value;
    });
  }

  void openManuItem(value) {
    if (value == "history") {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const History();
      }));
    } else if (value == "author") {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const AboutAuthor();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        actions: [
          PopupMenuButton(
            onSelected: (value) => openManuItem(value),
            color: const Color.fromARGB(255, 175, 153, 160),
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                value: "history",
                child: ListTile(
                  leading: Icon(Icons.format_list_bulleted),
                  title: Text('History'),
                ),
              ),
              const PopupMenuItem(
                value: "author",
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('About the author'),
                ),
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  child: ToggleSwitch(
                    activeBgColor: const [Color(0xFF1D1E33), Color(0xFF1D1E33)],
                    initialLabelIndex: _isMetric ? 1 : 0,
                    totalSwitches: 2,
                    labels: const ['Imperial', 'Metric'],
                    onToggle: (index) {
                      switch (index) {
                        case 0:
                          {
                            setState(() {
                              _isMetric = false;
                            });
                          }
                          break;

                        case 2:
                          {
                            setState(() {
                              _isMetric = true;
                            });
                          }
                          break;

                        default:
                          {
                            setState(() {
                              _isMetric = true;
                            });
                          }
                          break;
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
        title: const Text("BMI Calculator"),
      ),
      body: BMICounter(
        isMetric: _isMetric,
      ),
    );
  }
}
