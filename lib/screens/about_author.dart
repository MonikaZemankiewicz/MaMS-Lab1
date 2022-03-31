import 'package:flutter/material.dart';
import '../constants.dart';

class AboutAuthor extends StatefulWidget {
  const AboutAuthor({Key? key}) : super(key: key);

  @override
  State<AboutAuthor> createState() => _AboutAuthorState();
}

class _AboutAuthorState extends State<AboutAuthor> {
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
          children: const [
            Icon(
              Icons.person,
              color: Colors.white,
              size: 100.0,
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  style: kPickerLabelStyle),
            ),
          ],
        ));
  }
}
