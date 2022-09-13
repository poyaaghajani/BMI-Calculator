import 'package:bmi_calculator/costants/costants.dart';
import 'package:flutter/material.dart';

class RightShape extends StatelessWidget {
  RightShape({Key? key, this.width = 0}) : super(key: key);

  double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: width,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
            ),
            color: pinkColor,
          ),
        ),
      ],
    );
  }
}
