import 'package:ad_invoice_mobile/controllers/apicontrollers/logincontroller.dart';
import 'package:ad_invoice_mobile/controllers/dashboardcontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/launchscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/generalscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/supportscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/transactionscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/usermanagement/usermanagementmainscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Settingscreen extends StatelessWidget {
   Settingscreen({super.key});

  final Logincontroller logincontroller=Get.find<Logincontroller>();
  final Dashboardcontroller dashboardcontroller=Get.find<Dashboardcontroller>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(height: 10,),
         SizedBox(height: 10,),
         Card(
          elevation: 6,
          child: ListTile(
        onTap: (){
          Get.to(()=>Usermanagementmainscreen());
        },
        leading: Icon(Icons.manage_accounts_outlined,color: Colors.blue,),
        title: Text("User Management",style: TextStyle(fontWeight: FontWeight.bold),),
        trailing: Icon(Icons.arrow_forward_ios_outlined),

      ),
        ),
        SizedBox(height: 10,),
        Card(
          elevation: 6,
          child: ListTile(
        onTap: (){
          Get.to(()=>Supportscreen());
        },
        leading: Icon(Icons.support,color: Colors.red,),
        title: Text("Support",style: TextStyle(fontWeight: FontWeight.bold),),
        trailing: Icon(Icons.arrow_forward_ios_outlined),
      ),
        ),
         SizedBox(height: 10,),
        Card(
          elevation: 6,
          child: ListTile(
        onTap: (){
         showDialog(context: context, builder: (ctx)=>
         AlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure want to logout?"),
          actions: [
            Custombutton(label: "Cancel", onpressed: (){
              Navigator.pop(ctx);

            }),
            SizedBox(width: 5,),
            Custombutton(label: "Logout", onpressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Launchscreen()));
              logincontroller.accesstoken.value='';
              logincontroller.clearfield();
              dashboardcontroller.selectedindex.value=0;
            })
          ],
         ));
        },
        leading: Icon(Icons.logout),
        title: Text("Logout"),
        trailing: Icon(Icons.arrow_forward_ios_outlined),
      ),
        ),
        
      ],
    );
}
}