import 'package:bmi_calculator/bmi_brain.dart';
import 'package:bmi_calculator/model/constant.dart';
import 'package:bmi_calculator/model/reuseablecard.dart';
import 'package:bmi_calculator/model/round_icon_button.dart';
import 'package:bmi_calculator/resultscreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class Bmi extends StatefulWidget {
  const Bmi({super.key});
  @override
  State<Bmi> createState() => BmiState();
}

class BmiState extends State<Bmi> {
  var weight = 50;
  var age = 20;
  double height = 150;
  Gender? selectedGender;

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Reuseablecard(
                      onpressed: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      elevation: (selectedGender == Gender.male) ? 0.8 : 2,
                      keychild: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male,
                            size: 80,
                          ),
                          Text("Male", style: kLabelTextStyle)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Reuseablecard(
                      onpressed: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      elevation: (selectedGender == Gender.female) ? 0.8 : 2,
                      keychild: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female,
                            size: 80,
                          ),
                          Text("Female", style: kLabelTextStyle)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Height Selector
          Expanded(
            child: Reuseablecard(
              elevation: 2,
              onpressed: () {},
              keychild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Height", style: kLabelTextStyle),
                  Text(
                    height.round().toString(),
                    style: kNumberTextStyle,
                  ),
                  Slider(
                    thumbColor: Colors.red,
                    value: height,
                    min: 110,
                    max: 220,
                    label: height.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Reuseablecard(
                      elevation: 2,
                      onpressed: () {},
                      keychild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Weight", style: kLabelTextStyle),
                          Text(weight.toString(), style: kNumberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(
                                icon: const Icon(FontAwesomeIcons.minus),
                                onpressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              RoundIconButton(
                                icon: const Icon(Icons.add),
                                onpressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Reuseablecard(
                      elevation: 2,
                      onpressed: () {},
                      keychild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Age", style: kLabelTextStyle),
                          Text(age.toString(), style: kNumberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(
                                icon: const Icon(FontAwesomeIcons.minus),
                                onpressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              RoundIconButton(
                                icon: const Icon(Icons.add),
                                onpressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
                CalculatorBrain cals =
                    CalculatorBrain(height: height.round(), weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultScreen(
                        resultText: cals.getResult(),
                        bmiResult: cals.calculateBMI(),
                        interpretation: cals.getInterpretation(),
                      );
                    },
                  ),
                );
              },
              child: const Text(
                "Calculate BMI",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
