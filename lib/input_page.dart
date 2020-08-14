import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon.dart';
import 'resuable.dart';

const bottomBoxSize = 80.0;
const activationCardColor = Color(0xFF1D1E33);
const inactivationCardColor = Color(0xFF111328);
const bottomBoxColor = 0xFFEC1455;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactivationCardColor;
  Color femaleCardColor = inactivationCardColor;

  void updateColor(int gender) {
    if (gender == 1) {
      if (maleCardColor == inactivationCardColor) {
        maleCardColor = activationCardColor;
      } else
        maleCardColor = inactivationCardColor;
    }
    if (gender == 2) {
      if (femaleCardColor == inactivationCardColor) {
        femaleCardColor = activationCardColor;
      } else
        femaleCardColor = inactivationCardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(1);
                      });
                    },
                    child: ResuableCard(
                        cardChild: iconWidget(
                            icon: FontAwesomeIcons.mars, label: 'Male'),
                        colour: maleCardColor),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColor(2);
                      });
                    child: ResuableCard(
                        cardChild: iconWidget(
                            icon: FontAwesomeIcons.venus, label: 'Female'),
                        colour: femaleCardColor),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(2);
                        });
                      },
                      child: ResuableCard(colour: activationCardColor)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child: ResuableCard(colour: activationCardColor),
              ),
              Expanded(child: ResuableCard(colour: activationCardColor)),
            ]),
          ),
          Container(
            color: Color(bottomBoxColor),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomBoxSize,
          ),
        ],
      ),
    );
  }
}
