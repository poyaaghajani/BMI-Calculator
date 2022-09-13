import 'package:bmi_calculator/costants/costants.dart';
import 'package:bmi_calculator/shapes/left_shape.dart';
import 'package:bmi_calculator/shapes/right_shapr.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  double resultBMI = 0;
  String resultText = '';
  bool isWeightNormal = false;

  double widthGood = 100;
  double widthBad = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: darkColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[350],
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 130),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: 150,
                    child: TextField(
                      controller: weightController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Weght',
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 0, style: BorderStyle.none),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'height',
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 0, style: BorderStyle.none),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 70),
              InkWell(
                onTap: () {
                  final weight = double.parse(weightController.text);
                  final height = double.parse(heightController.text);
                  setState(() {
                    resultBMI = weight / (height * height);
                    if (resultBMI > 25) {
                      widthBad = 250;
                      widthGood = 120;
                      resultText = 'you are overweight.!';
                    } else if (resultBMI >= 18.5 && resultBMI <= 25) {
                      widthBad = 120;
                      widthGood = 250;
                      resultText = 'your weigh is normal';
                      setState(() {
                        isWeightNormal = true;
                      });
                    } else {
                      widthBad = 200;
                      widthGood = 70;
                      resultText = 'you are underweght.!';
                    }
                  });
                },
                child: Text(
                  'CALCULATE.!',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: darkColor),
                ),
              ),
              SizedBox(height: 40),
              Text(
                '${resultBMI.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: darkColor),
              ),
              SizedBox(height: 60),
              RightShape(width: widthBad),
              LeftShape(width: widthGood),
              SizedBox(height: 50),
              Text(
                '$resultText',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: isWeightNormal ? greenColor : Colors.purple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
