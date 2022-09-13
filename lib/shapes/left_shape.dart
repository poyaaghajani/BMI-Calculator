import 'package:bmi_calculator/costants/costants.dart';
import 'package:flutter/material.dart';

class LeftShape extends StatelessWidget {
  LeftShape({Key? key, this.width = 0}) : super(key: key);

  double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: width,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(100),
            ),
            color: greenColor,
          ),
        ),
      ],
    );
  }
}
