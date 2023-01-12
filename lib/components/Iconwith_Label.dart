import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class IconwithLabel extends StatelessWidget {
  final IconData icon;
  final String label;


  const IconwithLabel({
    required this.icon,
    required this.label
  }) ;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Icon(
            icon,
            size: 80,),
        ),
        Container(
          child: Text(label),
        ),
      ],
    );
  }
}















