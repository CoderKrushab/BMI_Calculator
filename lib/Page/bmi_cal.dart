import 'package:bmi_calculator/Page/result_ui.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class bmi_ui extends StatefulWidget {
  const bmi_ui({Key? key}) : super(key: key);

  @override
  State<bmi_ui> createState() => _bmi_uiState();
}

class _bmi_uiState extends State<bmi_ui> {
  Color male = Colors.black;
  Color female = Colors.black;
  double weight = 0;
  double age = 0;
  late FToast fToast;
  double sliderVal = 50;
  double bmi = 0;
  String category = '';
  String text = '';

  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.black,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(
          Icons.error,
          color: Colors.white,
        ),
        SizedBox(
          width: 12.0,
        ),
        Text(
          "Please Enter All Details",
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  );

  _showToast() {
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 3),
    );
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff0A8F08),
        title: const Text("BMI Calculator"),
        actions: [
          IconButton(
              onPressed: () {
                male = Colors.black;
                female = Colors.black;
                sliderVal = 50;
                weight = 0;
                age = 0;
                setState(() {});
              },
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      female = Colors.black;
                      setState(() {
                        male = (male == Colors.black)
                            ? const Color(0xff0A8F08)
                            : Colors.black;
                      });
                    },
                    child: Container(
                      height: 200,
                      width: 125,
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3))
                          ]),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male,
                            size: 100,
                            color: male,
                          ),
                          const Text(
                            "Male",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      male = Colors.black;
                      setState(() {
                        female = (female == Colors.black)
                            ? const Color(0xff0A8F08)
                            : Colors.black;
                      });
                    },
                    child: Container(
                      height: 200,
                      width: 125,
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3))
                          ]),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female,
                            size: 100,
                            color: female,
                          ),
                          const Text(
                            "Female",
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            height: 500,
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3))
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: 10,
                ),
                const Text("Height",
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 17)),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(sliderVal.toString().split('.')[0],
                        style: const TextStyle(fontSize: 50)),
                    const Text("cm", style: TextStyle(fontSize: 30)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Slider(
                  value: sliderVal,
                  activeColor: const Color(0xff0A8F08),
                  inactiveColor: const Color(0xff0A8F08).withOpacity(0.3),
                  min: 50,
                  max: 1000,
                  onChanged: (value) {
                    setState(() {
                      sliderVal = value;
                    });
                  },
                ),
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: Container(
                height: 200,
                width: 125,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3))
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("WEIGHT",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 17)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("$weight",
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 50)),
                        const Padding(
                          padding: EdgeInsets.only(left: 5, top: 5),
                          child: Text("kg", style: TextStyle(fontSize: 20)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              weight++;
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor:
                                const Color(0xff0A8F08).withOpacity(0.2),
                            radius: 28,
                            child: const Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (weight > 0) {
                              setState(() {
                                weight--;
                              });
                            }
                          },
                          child: CircleAvatar(
                              backgroundColor:
                                  const Color(0xff0A8F08).withOpacity(0.2),
                              radius: 28,
                              child: const Text(
                                "-",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                height: 200,
                width: 125,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3))
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("AGE",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 17)),
                    Text("$age",
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 50)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              age++;
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor:
                                const Color(0xff0A8F08).withOpacity(0.2),
                            radius: 28,
                            child: const Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (age > 0) {
                              setState(() {
                                age--;
                              });
                            }
                          },
                          child: CircleAvatar(
                              backgroundColor:
                                  const Color(0xff0A8F08).withOpacity(0.2),
                              radius: 28,
                              child: const Text(
                                "-",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              )),
            ],
          )),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 102.5, vertical: 20),
              primary: const Color(0xff0A8F08),
            ),
            onPressed: () async {
              setState(() {
                double height = sliderVal / 100;
                bmi = weight / (height * height);

                if (bmi < 16) {
                  category = 'SEVERE THINNESS';
                  text = 'You have a severe thinness body weight';
                } else if (bmi >= 16 && bmi < 25) {
                  category = 'MODERATE THINNESS';
                  text = 'You have a moderate thinness body weight';
                } else if (bmi >= 25 && bmi < 50) {
                  category = 'MILD THINNESS';
                  text = 'You have a mild thinness body weight';
                } else if (bmi >= 50 && bmi < 75) {
                  category = 'NORMAL THINNESS';
                  text = 'You have a normal body weight Good Job';
                } else if (bmi >= 75 && bmi < 95) {
                  category = 'OVER WEIGHT';
                  text = 'You have a over body weight Good Job';
                } else if (bmi >= 95 && bmi < 110) {
                  category = 'OBESE CLASS I';
                  text = 'You have a obese class I body weight';
                } else if (bmi >= 110 && bmi < 125) {
                  category = 'OBESE CLASS II';
                  text = 'You have a obese class II body weight';
                } else if (bmi >= 125 && bmi < 150) {
                  category = 'OBESE CLASS III';
                  text = 'You have a obese class III body weight';
                }

                if (weight != 0 &&
                    age != 0 &&
                    (male != Colors.black || female != Colors.black)) {
                  print("hello");
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return result(bmi, category, text, weight, height, age,
                          male, female);
                    },
                  ));
                } else {
                  _showToast();
                }
              });
            },
            child: const Text(
              "CALCULATE YOUR BMI",
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
