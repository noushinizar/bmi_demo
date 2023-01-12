import 'package:bmi_demo/screens/input_page.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        //primaryColor: Color(0xff1d1e33),
        scaffoldBackgroundColor: Color(0xff0a0321),
        accentColor: Colors.pink,
        textTheme: TextTheme(bodyText2:TextStyle(color: Colors.white)),
        appBarTheme: AppBarTheme(elevation: 0,
            centerTitle: true,
            color: Color(0xff0a0321),
        )
      ),
      home: InputPage(),
    );
  }
}
