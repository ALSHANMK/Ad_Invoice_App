import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Customforfield extends StatelessWidget {
  final String hinttext;
  final IconData prefixicon;
  final TextEditingController? controller;
  final ValueChanged<String>? onchanged;

  const Customforfield({
    super.key,
    required this.hinttext,
    required this.prefixicon,
    this.controller,
    this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    double responsiveWidth = ResponsiveValue<double>(context,
        defaultValue: 300.0,
        conditionalValues: [
          Condition.smallerThan(name: TABLET, value: 260.0),
          Condition.largerThan(name: TABLET, value: 400.0),
        ]).value;

    return SizedBox(
      width: responsiveWidth,
      child: TextFormField(
        controller: controller,
        onChanged: onchanged,
        decoration: InputDecoration(
          
          hintText: hinttext,
          prefixIcon: Icon(prefixicon),
          filled: true,
          fillColor: Colors.grey[350],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}