import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {

  final String label;
  final VoidCallback onpressed;
  const Custombutton({super.key,
  required this.label,
  required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onpressed,style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[800]), child:

    Text(label,style: TextStyle(color: Colors.white),) 
    );
  }
}