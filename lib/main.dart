import 'package:bmi_cal/icon_content.dart';
import 'package:bmi_cal/result_card.dart';
import 'package:bmi_cal/results_screen.dart';
import 'package:bmi_cal/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'reusable_container.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    title: "BMI Calculator",
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color maleColor = k_inactiveBoxColor;
  Color femaleColor = k_inactiveBoxColor;

  int height = 180;
  int weight = 60;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(
            child: Text("BMI CALCULATOR"),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableContainer(
                      colour: maleColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.male,
                        label: "MALE",
                      ),
                      onPress: () {
                        setState(() {
                          maleColor = k_activeBoxColor;
                          femaleColor = k_inactiveBoxColor;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableContainer(
                      colour: femaleColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.female,
                        label: "FEMALE",
                      ),
                      onPress: () {
                        setState(() {
                          femaleColor = k_activeBoxColor;
                          maleColor = k_inactiveBoxColor;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableContainer(
                colour: k_activeBoxColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "HEIGHT",
                      style: k_fontStyle.copyWith(
                        fontSize: 30,
                        color: Colors.grey[400],
                      ),
                    ),
                    Text(
                      height.toString() + "cm",
                      style: k_fontStyle.copyWith(fontSize: 50),
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        activeTrackColor: Colors.pinkAccent,
                        inactiveTrackColor: Colors.white,
                        thumbColor: Colors.pinkAccent,
                        overlayColor: Colors.red[100],
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                      ),
                      child: Slider(
                        onChanged: (double value) {
                          setState(() {
                            height = value.toInt();
                          });
                        },
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableContainer(
                      colour: k_activeBoxColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "WEIGHT",
                            style: k_fontStyle.copyWith(
                              fontSize: 30,
                              color: Colors.grey[400],
                            ),
                          ),
                          Text(
                            weight.toString() + "kg",
                            style: k_fontStyle.copyWith(fontSize: 50),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              RoundedButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    weight--;
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
                    child: ReusableContainer(
                      colour: k_activeBoxColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "AGE",
                            style: k_fontStyle.copyWith(
                              fontSize: 30,
                              color: Colors.grey[400],
                            ),
                          ),
                          Text(
                            age.toString(),
                            style: k_fontStyle.copyWith(fontSize: 50),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              RoundedButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: () {
                  ResultCard resultCard = ResultCard(height, weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsScreen(
                        bmi: resultCard.getValue().toStringAsFixed(1),
                        result: resultCard.getResult(),
                        message: resultCard.getMessage(),
                      ),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    minimumSize: Size(double.infinity, 70)),
                child: Text(
                  "CALCULATE",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
