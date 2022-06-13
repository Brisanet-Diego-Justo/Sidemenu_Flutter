import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        height: double.infinity,
        color: Colors.green,
        child: Center(          
          child: Text("Dashboard!"),
          ),
      );
  }
}