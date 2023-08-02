import 'package:bmi_calculate/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'my_classes.dart';
import 'result_page.dart';
import 'brain_of_calculator.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

enum Gender { male, female }

class _MainPageState extends State<MainPage> {
  int height = 180;
  int weight = 90;
  int age = 25;
  Gender active = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "BKİ HESAPLAMA",
            style: TextStyle(
              color: second_colour,
            ),
          ),
        ),
      ),
      backgroundColor: third_colour,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        active = Gender.male;
                      });
                    },
                    colour: active == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: CardParents(
                        icon: FontAwesomeIcons.venus, label: "ERKEK"),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        active = Gender.female;
                      });
                    },
                    colour: active == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: CardParents(
                        icon: FontAwesomeIcons.mars, label: "KADIN"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: first_colour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "BOY",
                    style: ktextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kLargeNumberStyle,
                      ),
                      Text(
                        "cm",
                        style: kSmallStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: fourth_colour,
                      inactiveTrackColor: fifth_colour,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 15),
                      overlayColor: second_colour,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 300,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: first_colour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "KİLO",
                          style: ktextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IncreaseButtons(
                                icon: FontAwesomeIcons.minus,
                                pressButton: () {
                                  if (weight >= 1) {
                                    setState(() {
                                      weight--;
                                    });
                                  }
                                }),
                            SizedBox(
                              width: 20,
                            ),
                            IncreaseButtons(
                                icon: FontAwesomeIcons.plus,
                                pressButton: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: first_colour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "YAŞ",
                          style: ktextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IncreaseButtons(
                                icon: FontAwesomeIcons.minus,
                                pressButton: () {
                                  if (age >= 1) {
                                    setState(() {
                                      age--;
                                    });
                                  }
                                }),
                            SizedBox(
                              width: 20,
                            ),
                            IncreaseButtons(
                                icon: FontAwesomeIcons.plus,
                                pressButton: () {
                                  if (age <= 100) {
                                    setState(() {
                                      age++;
                                    });
                                  }
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
              label: "HESAPLA",
              pressButton: () {
                Calculate calculator =
                    Calculate(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmiResult: calculator.calculate_bmi(),
                              bodyType: calculator.getBodyType(),
                              description: calculator.getDescription(),
                            )));
              })
        ],
      ),
    );
  }
}
