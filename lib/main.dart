import 'package:ad_invoice_mobile/Service/addproductservice.dart';
import 'package:ad_invoice_mobile/Service/clientlistservice.dart';
import 'package:ad_invoice_mobile/Service/create_client_service.dart';
import 'package:ad_invoice_mobile/Service/getproposalservice.dart';
import 'package:ad_invoice_mobile/Service/loginservice.dart';
import 'package:ad_invoice_mobile/Service/productlistservice.dart';
import 'package:ad_invoice_mobile/Service/proposalcreationservice.dart';
import 'package:ad_invoice_mobile/Service/registerservice.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/getproposalcontroller.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/logincontroller.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/productlistcontroller.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/proposalcreationcontroller.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/usermanagementcontroller.dart';
import 'package:ad_invoice_mobile/controllers/dropdowncontroller.dart';
import 'package:ad_invoice_mobile/controllers/proposalsecondscreencontroller.dart';
import 'package:ad_invoice_mobile/controllers/radiobuttoncontroller.dart';
import 'package:ad_invoice_mobile/controllers/userscontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/launchscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/loginscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/registerscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/invoice/emergency_invoice.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/invoice/invoicefirstscreen.dart';

import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/propsals/proposalfirstscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/receipt/receiptfirstscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/receipt/recieptpreview.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/addnewclientscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/dashboardmain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  Get.put(Dropdowncontroller());
  Get.put(Radiobuttoncontroller());
  
  Get.lazyPut(() => Registerservice());
  Get.lazyPut(()=>Loginservice());
  Get.lazyPut(()=>CreateClientService());
  Get.lazyPut(()=>Logincontroller());
  Get.lazyPut(()=>Clientlistservice());
  Get.lazyPut(()=>Addproductservice());
  Get.lazyPut(()=>Proposalcreationservice());
  Get.lazyPut(()=>Productlistservice());
  Get.lazyPut(()=>Productlistcontroller());
  Get.lazyPut(()=>Userscontroller());
  Get.lazyPut(()=>Proposalsecondscreencontroller());
  Get.lazyPut(()=>Proposalcreationcontroller());
  Get.lazyPut(()=>Getproposalcontroller());
  Get.lazyPut(()=>Getproposalservice());
  Get.lazyPut(()=>Usermanagementcontroller());
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

      home:Loginscreen(),
    );
  }
}



