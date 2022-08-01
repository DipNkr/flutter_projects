import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('I Am Poor'),
          ),
          backgroundColor: Colors.amberAccent,
        ),
        body: const Center(
          child: Image(
            image: AssetImage('images/i_am_poor.jpg'),
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
    ),
  );
}
