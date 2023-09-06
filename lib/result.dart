import 'package:bmi/home.dart';
import 'package:flutter/material.dart';

class Output extends StatefulWidget {
  Output({required this.bmi, Key? key}) : super(key: key);

  double bmi;

  @override
  State<Output> createState() => _OutputState();
}

class _OutputState extends State<Output> {
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
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'YOUR RESULT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 607.571,
              color: Color(0xFF1D1E32),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text(
                      bmical(widget.bmi),
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 23
                    ),
                  ),
                  SizedBox(height: 240),
                  Text(''
                      '${widget.bmi.toStringAsFixed(1)}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      color: Colors.white,

                    ),

                  ),
                  SizedBox(height: 173,),
                  Text(
                    bmica(widget.bmi),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
        },
        child: Container(
          height: 50,
          color: Color(0xFFD93558),
          child: Center(
            child: Text(
              'RE-CALCULATE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
  String bmical(double bmi){
    if(bmi>=18.5 && bmi<=24.9){
      return 'NORMAL';
    }
    else if(bmi<18.5){
      return 'UNDERWEIGHT';
    }
    else if(bmi>=25 && bmi<=29.9){
      return 'OVERWEIGHT';
    }
    else{
      return ' OBESE RANGE';
    }
  }
  String bmica(double bmi){
    if(bmi>=18.5 && bmi<=24.9){
      return 'You have a Normal body weight. Good job';
    }
    else if(bmi<18.5){
      return 'Your BMI suggests you\'re underweight. Consider a healthier lifestyle.';
    }
    else if(bmi>=25 && bmi<=29.9){
      return 'Your BMI suggests you\'re overweight. Consider a healthier lifestyle.';
    }
    else{
      return 'Your BMI indicates obesity. Seek professional guidance for your health.';
    }
  }
}
