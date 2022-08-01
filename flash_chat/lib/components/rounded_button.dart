import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(this.colour, this.onPressed, this.buttonTitle);

  late Color colour;
  late Function() onPressed;
  late String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonTitle,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
