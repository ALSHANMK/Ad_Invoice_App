import 'package:ad_invoice_mobile/controllers/dashboardcontroller.dart';
import 'package:ad_invoice_mobile/controllers/notificationcontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/registerscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/propsals/proposalfirstscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/clientscreen.dart';

import 'package:ad_invoice_mobile/ui/screens/dashboard/homescreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/profilescreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/reportscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/itemscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/settingscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/widgets/notificaionpanel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Dashboardmain extends StatelessWidget {
  const Dashboardmain({super.key});

  @override
  Widget build(BuildContext context) {

    final Dashboardcontroller dashboardcontroller=Get.put(Dashboardcontroller());
    final Notificationcontroller notificationcontroller=Get.put(Notificationcontroller());

    final List<Widget> _screens=[
      Homescreen(),
      Clientscreen(),
      Itemscreen(),
      Settingscreen(),
      
    ];


    final bool isMobile=ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    return Scaffold(
        appBar: PreferredSize(preferredSize:isMobile? const Size.fromHeight(50):const Size.fromHeight(80), 
        
       
         
          child: SafeArea(child: Row(
            
            children: [
             PopupMenuButton<String>(icon: Icon(Icons.menu),
             
             borderRadius: BorderRadius.circular(20),
             requestFocus: true,
             elevation: 4,
             constraints: BoxConstraints(minHeight: double.infinity/2,minWidth: 25),
             iconColor: Colors.blue,
             shadowColor: Colors.black,
             surfaceTintColor: const Color.fromARGB(255, 92, 1, 1),
             
             itemBuilder: (context) => <PopupMenuEntry<String>>[

              PopupMenuItem<String>(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Profilescreen()));
                },
                padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                value: "profile",
                child: Text("Profile",style: TextStyle(fontWeight: FontWeight.bold),),
               ),
                PopupMenuItem<String>(
                  
                  padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                value: "Invoices",
                child: Text("Invoices",style: TextStyle(fontWeight: FontWeight.bold),),
               ),
                PopupMenuItem<String>(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Clientscreen()));
                  },
                 padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                value: "Clients",
                child: Text("Clients",style: TextStyle(fontWeight: FontWeight.bold),),
               ),
               PopupMenuItem<String>(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Reportscreen()));
                },
                padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                value: "report",
                child: Text("Reports",style: TextStyle(fontWeight: FontWeight.bold),),
               ),
               PopupMenuItem<String>(
                padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                value: "items",
                child: Text("Items",style: TextStyle(fontWeight: FontWeight.bold),),
               ),
               PopupMenuItem<String>(
                padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                value: "more",
                child: Text("More",style: TextStyle(fontWeight: FontWeight.bold),),
               ),
             ]
             ),
              SizedBox(width: 10,),

                SizedBox(
                  width: isMobile?210:380,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: "Search clients",
                      suffixIcon: Icon(Icons.search),
                      
                    ),
                  ),
                ),
                const Spacer(),
                //isMobile?SizedBox(width: 10,):SizedBox(width: 180,),
              IconButton(onPressed: (){
                notificationcontroller.togglepanel();
              }, icon: Icon(Icons.notifications),alignment: Alignment.bottomRight,),

             
              //isMobile?SizedBox(width: 5,):SizedBox(width: 10,),
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Profilescreen()));
              }, icon: Icon(Icons.person),alignment: Alignment.bottomRight,)
            ],
          )),


        ),
        body: Stack(
          children: [
            Obx(()=>_screens[dashboardcontroller.selectedindex.value]),
            Notificaionpanel(),
          ],
        ),
       

        bottomNavigationBar: Obx(()=>BottomNavigationBar(
          currentIndex: dashboardcontroller.selectedindex.value,
          onTap: dashboardcontroller.changetab,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: [

            BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.blue,),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.attach_money,color: Colors.blue,),label: "Clients"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_checkout_sharp ,color: Colors.blue,),label: "Items"),
            BottomNavigationBarItem(icon: Icon(Icons.settings,color: Colors.blue,),label: "Settings"),
          ])
   ),
   floatingActionButton: SpeedDial(
    backgroundColor: Colors.transparent,
    activeBackgroundColor: Colors.blue,
    elevation: 0,
    overlayOpacity: 0.8,
    overlayColor: Colors.black,
    buttonSize: Size(40, 50),
    foregroundColor: Colors.black,
    icon: Icons.add,
    activeIcon: Icons.close,
    children: [
      SpeedDialChild(
        
        backgroundColor: Colors.blue,
        label: "Receipts",
        onTap: (){
          
        },
        child: Icon(Icons.payment),
        labelStyle: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)
      ),
      SpeedDialChild(
        backgroundColor: Colors.blue,
        child: Icon(Icons.receipt),
        label: "New Proposal",
        onTap: (){
          Get.to(Proposalfirstscreen());
        },
        labelStyle: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)
        
      ),
      SpeedDialChild(
        backgroundColor: Colors.blue,
        label: "New Invoice",
        onTap: (){},
        child: Icon(Icons.description),
        labelStyle: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)
      ),
    ],
   ),
      


        
    );
    
  }
}