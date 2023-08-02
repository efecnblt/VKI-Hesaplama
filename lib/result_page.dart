import 'package:bmi_calculate/constants.dart';
import 'package:flutter/material.dart';
import 'my_classes.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiResult,
      required this.bodyType,
      required this.description});

  final double bmiResult;
  final String bodyType;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BKİ HESAPLAMA",
          style: ktextStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(left: 15),
            alignment: Alignment.bottomLeft,
            child: const Text(
              "Sonucunuz",
              style: kResultTextStyle,
            ),
          )),
          Expanded(
              flex: 10,

              child: ReusableCard(

                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Text(
                      bodyType,
                      style: kBodyTypeTextStyle,
                    ),
                    Text(
                      bmiResult.toStringAsFixed(1),
                      style: kLargeNumberStyle,
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(

                        textAlign: TextAlign.center,
                        description,
                        style: kDescriptionTextStyle,
                      ),
                    )
                  ],
                ),
                colour: first_colour,
              )),
          BottomButton(
              label: "TEKRAR HESAPLA",
              pressButton: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
