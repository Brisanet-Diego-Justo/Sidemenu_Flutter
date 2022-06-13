import 'package:flutter/material.dart';

class Sales extends StatelessWidget {
  const Sales({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       width: double.infinity,
        height: double.infinity,
        color: Colors.orange,
        child: Center(        
          child: Text("Sales!"),
          ),
      );      
  }
}