import 'package:ad_invoice_mobile/ui/screens/auth/launchscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/propsals/proposalfirstscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/dashboardmain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      builder: (context, child) => ResponsiveBreakpoints.builder(
  child: child!,
  breakpoints: [
    const Breakpoint(start: 0, end: 600, name: MOBILE),     // mobile up to 600
    const Breakpoint(start: 601, end: 1024, name: TABLET),  // tablet up to 1024
    const Breakpoint(start: 1025, end: double.infinity, name: DESKTOP),
  ],
),

      home: Launchscreen(),
    );
  }
}



