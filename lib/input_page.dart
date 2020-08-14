import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon.dart';
import 'resuable.dart';
import 'constants.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ResuableCard(
                      onPressed: () {
                        setState(() {
                          selectedGender = GenderType.male;
                        });
                      },
                      cardChild: iconWidget(
                          icon: FontAwesomeIcons.mars, label: 'Male'),
                      colour: selectedGender == GenderType.male
                          ? kActivationCardColor
                          : kInactivationCardColor),
                ),
                Expanded(
                  child: ResuableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    cardChild: iconWidget(
                        icon: FontAwesomeIcons.venus, label: 'Female'),
                    colour: selectedGender == GenderType.female
                        ? kActivationCardColor
                        : kInactivationCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ResuableCard(
              colour: kActivationCardColor,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: kNumberTextStyle),
                        Text('cm', style: kLabelTextStyle)
                      ],
                    ),
                    Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  ]),
            ),
          ),
          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child: ResuableCard(colour: kActivationCardColor),
              ),
              Expanded(child: ResuableCard(colour: kActivationCardColor)),
            ]),
          ),
          Container(
            color: Color(kBottomBoxColor),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomBoxSize,
          ),
        ],
      ),
    );
  }
}
