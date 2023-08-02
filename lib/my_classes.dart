import 'package:flutter/material.dart';
import 'constants.dart';

class IncreaseButtons extends StatelessWidget {
  IncreaseButtons({required this.icon, required this.pressButton});
  final IconData icon;
  final void Function() pressButton;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: pressButton,
      shape: CircleBorder(),
      elevation: 8,
      highlightColor: Colors.green,
      fillColor: fourth_colour,
      child: Icon(icon, color: third_colour),
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
    );
  }
}

class CardParents extends StatelessWidget {
  CardParents({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 130,
          color: second_colour,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          label,
          style: TextStyle(
              color: third_colour, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({this.onTap, this.cardChild, required this.colour});

  final void Function()? onTap;
  final Widget? cardChild;
  final Color colour;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
class BottomButton extends StatelessWidget {
  BottomButton({required this.label, this.pressButton});

  final String label;
  final void Function()? pressButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressButton,
      child: Container(
        margin: EdgeInsets.only(top: 5),
        padding: EdgeInsets.only(bottom: 10),
        child: Center(
            child: Text(
              label,
              style: kBottomTextStyle,
            )),
        width: double.infinity,
        height: 70.0,
        color: fourth_colour,
      ),
    );
  }
}