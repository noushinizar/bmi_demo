import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget Mychild;
  final VoidCallback? onpress;
  const ReusableCard({
    required this.color,
     required this.Mychild,
    required this.onpress
  }) ;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: GestureDetector(
            onTap: onpress,
            child: Container(

              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
             child: Mychild,
            ),
          ),
        ));
  }
}
