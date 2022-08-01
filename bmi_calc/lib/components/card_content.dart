import 'package:flutter/material.dart';
import '../constants.dart';

class CardContent extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CardContent(this.icon, this.gender);
  final IconData icon;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
