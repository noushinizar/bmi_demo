
import 'package:bmi_demo/calculate_bmi.dart';
import 'package:bmi_demo/components/Iconwith_Label.dart';
import 'package:bmi_demo/components/Reusable_card.dart';
import 'package:bmi_demo/components/rounded_button.dart';
import 'package:bmi_demo/screens/Result_Page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

 enum GenderSelection{
   Male,
   Female
 }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
   final inActiveColor = Color(0xff1d1e33);
   final ActiveColor = Color(0x11d1e33);
   late GenderSelection selection= GenderSelection.Female;

  int height=150;
  int weight =40;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                  children: [
                    ReusableCard(color:selection == GenderSelection.Male ? ActiveColor : inActiveColor,
                      Mychild:IconwithLabel(
                        icon: FontAwesomeIcons.mars,
                        label: 'Male',
                      ), onpress: () {
                     setState(() {
                       selection = GenderSelection.Male;
                     });
                      },

                    ),
                   ReusableCard(color:selection == GenderSelection.Male ? inActiveColor : ActiveColor,
                       Mychild:IconwithLabel(
                         icon: FontAwesomeIcons.venus,
                         label: 'Female',
                       ), onpress: () {
                      setState(() {
                        selection = GenderSelection.Female;
                      });
                     },
                   ),
                  ],
              ),
            ),
            ReusableCard(color:  Color(0xff1d1e33),
              Mychild:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text('Height'),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                   textBaseline: TextBaseline.alphabetic,
                    children: [
                      Container(
                        child: Text(height.toString(),
                        style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        child: Text('cm',),
                      )
                    ],
                  ),
                  Container(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 2,
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xffeb1555),
                        overlayColor: Color(0x15eb1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        max: 220,
                          min:120 ,
                          onChanged: (double newValue){
                          setState(() {
                            height=newValue.toInt().round();
                          });
                        },
                      value: height.toDouble(),

                  ),
                    ),
                  ),
                ],
              ), onpress: () {  },),
            Expanded(
              child: Row(
                children: [
                  ReusableCard(color:  Color(0xff1d1e33),
                      Mychild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text("Weight"),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            children: [

                              Container(
                                child: Text(weight.toString(),
                                  style:TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
                              ),
                              Container(
                                child: Text('kg',),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedButton(icon: FontAwesomeIcons.plus,
                                  onpress: (){
                              setState(() {
                                weight++;
                              });
                                  },
                                  color: Color(0xff0A0E21)),
                              SizedBox(width: 5,),
                              RoundedButton(icon: FontAwesomeIcons.minus,
                                  onpress: (){
                                setState(() {
                                  weight--;
                                });
                                  },
                                  color: Color(0xff0A0E21)),
                            ],
                          ),
                        ],

                      ), onpress: () {  },),
                  ReusableCard(color:  Color(0xff1d1e33),
                      Mychild:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text("Age"),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            children: [

                              Container(
                                child: Text(age.toString(),
                                  style:TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
                              ),
                              Container(
                                child: Text('yr',),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedButton(icon: FontAwesomeIcons.plus,
                                  onpress: (){
                              setState(() {
                                age++;
                              });
                                  },
                                  color: Color(0xff0A0E21)),
                              SizedBox(width: 5,),
                              RoundedButton(icon: FontAwesomeIcons.minus,
                                  onpress: (){
                                setState(() {
                                  age--;
                                });
                                  },
                                  color: Color(0xff0A0E21)),
                            ],
                          ),
                        ],

                      ), onpress: () {  }, ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  Calculate  calculateBmi= new Calculate(height: height, weight: weight);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
                    bmi: calculateBmi.result(),
                    result:calculateBmi.getText() ,
                    advise: calculateBmi.getAdvise(),
                    textColor: calculateBmi.getTextColor(),
                  )));
                },
                child: Center(child: Text("Calculate",)),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffeb1555),
                 maximumSize: Size(double.infinity, 50),
                ),
                ),
          ],
        ),
      ),
    );
  }
}

