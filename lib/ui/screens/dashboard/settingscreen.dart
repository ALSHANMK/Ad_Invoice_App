import 'package:ad_invoice_mobile/ui/screens/auth/launchscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/generalscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/transactionscreen.dart';
import 'package:flutter/material.dart';

class Settingscreen extends StatelessWidget {
  const Settingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(height: 10,),
        Card(
          elevation: 6,
          child: ListTile(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Generalscreen()));
        },
        leading: Icon(Icons.settings),
        title: Text("General"),
        trailing: Icon(Icons.arrow_forward_ios_outlined),
      ),
        ),
        SizedBox(height: 10,),
        Card(
          elevation: 6,
          child: ListTile(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Transactionscreen()));
        },
        leading: Icon(Icons.currency_rupee_sharp),
        title: Text("Transactions"),
        trailing: Icon(Icons.arrow_forward_ios_outlined),
      ),
        ),
         SizedBox(height: 10,),
        Card(
          elevation: 6,
          child: ListTile(
        onTap: (){},
        leading: Icon(Icons.print),
        title: Text("Invoice print"),
        trailing: Icon(Icons.arrow_forward_ios_outlined),
      ),
        ),
         SizedBox(height: 10,),
        Card(
          elevation: 6,
          child: ListTile(
        onTap: (){},
        leading: Icon(Icons.browse_gallery_rounded),
        title: Text("Reminders"),
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