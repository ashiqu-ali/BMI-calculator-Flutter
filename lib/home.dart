import 'dart:math';

import 'package:bmi/result.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

enum Gender { Male, Female }

class _HomeState extends State<Home> {
  Gender? selectedGender;
  int height = 130;
  int weight = 30;
  int age = 18;
  double bmi=0,hight=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0B0E21),
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
          backgroundColor: Color(0xFF0B0E21),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        selectedGender = Gender.Male;
                        setState(() {

                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: selectedGender==Gender.Male?Colors.blue:Color(0xFF1D1E30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))
                          // fixedSize: Size(150 , 200)
                          ),
                      child: buildElevatedButton(
                          Icons.male,
                          "male",
                          selectedGender == Gender.Female
                              ? Colors.blue
                              : Color(0xFF1D1E30)),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            selectedGender = Gender.Female;
                            setState(() {

                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: selectedGender==Gender.Female?Colors.blue:Color(0xFF1D1E30),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))
                            // fixedSize: Size(150 , 200)
                          ),
                          child: buildElevatedButton(
                              Icons.female,
                              "Female",
                              selectedGender == Gender.Female
                                  ? Colors.blue
                                  : Color(0xFF1D1E30)),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Expanded(
                child: FractionallySizedBox(
                  widthFactor: 1.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF1D1E30),
                      borderRadius: BorderRadius.circular(
                          20), // change this value to adjust the curve
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'HEIGHT',
                            style: TextStyle(color: Color(0xFF7D7F8A)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '$height',
                                style: TextStyle(
                                    fontSize: 60, color: Colors.white),
                              ),
                              Text(
                                'cm',
                                style: TextStyle(color: Color(0xFF7D7F8A)),
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderThemeData(
                                thumbColor: Color(0xFFD93558),
                                activeTrackColor: Colors.white),
                            child: Slider(
                                min: 60,
                                max: 270,
                                value: height.toDouble(),
                                onChanged: (newvalue) {
                                  setState(() {
                                    height = newvalue.round();
                                  });
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF1D1E30),
                            borderRadius: BorderRadius.circular(
                                10), // change this value to adjust the curve
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(23.0),
                            child: Column(
                              children: [
                                Text(
                                  'WEIGHT',
                                  style: TextStyle(
                                      color: Color(0xFF777886), fontSize: 15),
                                ),
                                Text(
                                  '$weight',
                                  style: TextStyle(
                                      fontSize: 65, color: Colors.white),
                                ),
                                Row(
                                  children: [
                                    FloatingActionButton(
                                      child: Icon(Icons.remove),
                                      onPressed: () {
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                      backgroundColor: Color(0xFF4D4F5E),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    FloatingActionButton(
                                      child: Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                      backgroundColor: Color(0xFF4D4F5E),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF1D1E30),
                            borderRadius: BorderRadius.circular(
                                10), // change this value to adjust the curve
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(23.0),
                            child: Column(
                              children: [
                                Text('AGE',
                                    style: TextStyle(
                                        color: Color(0xFF777886),
                                        fontSize: 15)),
                                Text(
                                  '$age',
                                  style: TextStyle(
                                      fontSize: 65, color: Colors.white),
                                ),
                                Row(
                                  children: [
                                    FloatingActionButton(
                                      child: Icon(Icons.remove),
                                      onPressed: () {
                                        setState(() {
                                          age--;
                                        });
                                      },
                                      backgroundColor: Color(0xFF4D4F5E),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    FloatingActionButton(
                                      child: Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                      backgroundColor: Color(0xFF4D4F5E),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(

          onTap: () {
            hight=height*0.01;
            bmi=weight/(hight*hight);
            print(weight);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Output(bmi: bmi,)));
          },
          child: Container(
            height: 50,
            color: Color(0xFFD93558),
            child: Center(
              child: Text(
                'CALCULATE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ));
  }

  Column buildElevatedButton(IconData icons, String text, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icons,
          size: 100,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
