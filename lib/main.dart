import 'package:bmi_calculator/Page/bmi_cal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: bmi(),
  ));
}

class bmi extends StatefulWidget {
  const bmi({Key? key}) : super(key: key);

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  @override
  void initState() {
    super.initState();
    next();
  }

  next() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return bmi_ui();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A8F08),
      body: Column(
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          const Spacer(),
          Image.asset(
            "image/logo.png",
            scale: 2,
          ),
          const Spacer(
            flex: 3,
          ),
          const CircularProgressIndicator(
            backgroundColor: Color(0xff0A8F08),
            color: Colors.white,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Check your BMI",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
