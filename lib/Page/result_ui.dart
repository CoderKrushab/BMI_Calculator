import 'dart:core';

import 'package:bmi_calculator/Page/bmi_cal.dart';
import 'package:flutter/material.dart';

class result extends StatefulWidget {
  double bmi;
  double weight;
  double height;
  double age;
  String category;
  String text;
  Color male;
  Color female;

  result(this.bmi, this.category, this.text, this.weight, this.height, this.age,
      this.male, this.female);

  @override
  State<result> createState() => _resultState();
}

class _resultState extends State<result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Your BMI result",),
        backgroundColor: const Color(0xff0A8F08),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                widget.category,
                style: const TextStyle(
                    color: Color(0xff0A8F08),
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text(
                widget.bmi.toStringAsFixed(2),
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 60),
              ),
              Text(
                widget.text,
                style: const TextStyle(

                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0A8F08),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 127, vertical: 20),
                  primary: const Color(0xff0A8F08),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return const bmi_ui();
                    },
                  ));

                  Color male = Colors.black;
                  Color female = Colors.black;
                  widget.height = 50;
                  widget.weight = 0;
                  widget.age = 0;
                },
                child: const Text(
                  "RE-CALCULATE",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
