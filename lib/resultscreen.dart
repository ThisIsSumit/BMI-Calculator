import 'package:bmi_calculator/model/constant.dart';
import 'package:bmi_calculator/model/reuseablecard.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {required this.resultText,
      required this.bmiResult,
      required this.interpretation,
      super.key});
  final String resultText;
  final String bmiResult;
  final String interpretation;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(134, 0, 0, 0),
        title: const Center(
          child: Text(
            "BMI Calculator",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: const Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reuseablecard(
              elevation: 2,
              onpressed: () {},
              keychild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 70,
            margin: const EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(color: Colors.red),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Re-Calculate",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
