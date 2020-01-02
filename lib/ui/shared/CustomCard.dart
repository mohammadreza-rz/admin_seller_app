import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    this.width,
    this.height,
    this.color: Colors.white,
    this.margin,
    this.padding,
    this.child,
    this.boxShadow,
  });

  final double width;
  final double height;
  final Color color;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Widget child;
  final List<BoxShadow> boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      )
    );
  }
  
}