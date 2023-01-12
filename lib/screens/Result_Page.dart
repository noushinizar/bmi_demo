import 'package:bmi_demo/components/Reusable_card.dart';
import 'package:bmi_demo/screens/input_page.dart';
import 'package:flutter/material.dart';
class ResultPage extends StatefulWidget {
  final String bmi;
  final String result;
  final String advise;
  final Color textColor;

  ResultPage({required this.bmi,
    required this.result,
    required this.advise,
    required this.textColor});


  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Text('Result',
              style:TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold
              ) ,),
          ),
          ReusableCard(color:  Color(0xff1d1e33),
              Mychild: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text(widget.result,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: widget.textColor),
                    ),
                    ),
                  Text(widget.bmi,
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,),
                  ),
                  Text(widget.advise),


                ],
              ),
              onpress: (){}
    ),
          ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>InputPage()));
            },
            child: Center(child: Text("ReCalculate",)),
            style: ElevatedButton.styleFrom(
              primary: Color(0xffeb1555),
              maximumSize: Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }
}
