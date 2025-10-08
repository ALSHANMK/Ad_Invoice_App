import 'package:ad_invoice_mobile/controllers/notificationcontroller.dart';
import 'package:flutter/material.dart';

import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class Notificaionpanel extends StatelessWidget {
   Notificaionpanel({super.key});

final Notificationcontroller notificationcontroller=Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
    AnimatedPositioned(
      
      top: notificationcontroller.isVisible.value?0:-250,
      left: 0,
      right: 0,
      height: 200,
      duration: Duration(milliseconds: 300),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 231, 226, 226),
          borderRadius: BorderRadius.circular(20),
          
        ),
        width: 200,
        height: 200,
        
        child: Column(
          
          children: [
            Text("Notifications",style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey
            ),),

            ListTile(
              title: Center(
                child: Text("Payment done!",style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.redAccent
                ),),
              ),
            ),
            ListTile(
              title: Center(
                child: Text("New customer!",style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.redAccent
                ),),
              ),
            )
          ],
        ),

    ),
     
    ),
    );
  }
}