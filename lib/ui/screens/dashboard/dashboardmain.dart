
import 'package:ad_invoice_mobile/controllers/dashboardcontroller.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/notificationandsupportcontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/registerscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/invoice/invoicefirstscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/propsals/proposalfirstscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/receipt/receiptfirstscreen.dart';
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
  Dashboardmain({super.key});

      final Dashboardcontroller dashboardcontroller = Get.put(Dashboardcontroller());
    final Notificationandsupportcontroller notificationcontroller = Get.put(Notificationandsupportcontroller());

  @override
  Widget build(BuildContext context) {


    final List<Widget> screens = [
      Homescreen(),
      Clientscreen(),
      Itemscreen(),
      Settingscreen(),
    ];

    final bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            // Profile icon on the left
            IconButton(
              onPressed: () {
                Get.to(() => Profilescreen());
              },
              icon: Icon(Icons.person_outline),
              tooltip: "Profile",
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text("Welcome user !!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () {
              notificationcontroller.togglepanel();
              notificationcontroller.getnoti();
            },
            icon: Icon(Icons.notifications_outlined),
            tooltip: "Notifications",
          ),
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert),
            onSelected: (value) {
              _handleMenuSelection(value, context);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "invoices",
                child: ListTile(
                  leading: Icon(Icons.description, size: 20),
                  title: Text("Invoices", style: TextStyle(fontSize: 14)),
                ),
              ),
              PopupMenuItem(
                value: "clients",
                child: ListTile(
                  leading: Icon(Icons.people, size: 20),
                  title: Text("Clients", style: TextStyle(fontSize: 14)),
                ),
              ),
              PopupMenuItem(
                value: "reports",
                child: ListTile(
                  leading: Icon(Icons.analytics, size: 20),
                  title: Text("Reports", style: TextStyle(fontSize: 14)),
                ),
              ),
              PopupMenuItem(
                value: "items",
                child: ListTile(
                  leading: Icon(Icons.inventory_2, size: 20),
                  title: Text("Items", style: TextStyle(fontSize: 14)),
                ),
              ),
            ],
          ),
        ],
      ),
      
      body: Stack(
        children: [
          Obx(() => screens[dashboardcontroller.selectedindex.value]),
          Notificaionpanel(),
        ],
      ),

      bottomNavigationBar: Obx(() => Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey[200]!)),
        ),
        child: BottomNavigationBar(
          currentIndex: dashboardcontroller.selectedindex.value,
          onTap: dashboardcontroller.changetab,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue[700],
          unselectedItemColor: Colors.grey[600],
          selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          unselectedLabelStyle: TextStyle(fontSize: 12),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outline),
              activeIcon: Icon(Icons.people),
              label: "Clients",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2_outlined),
              activeIcon: Icon(Icons.inventory_2),
              label: "Items",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      )),

     floatingActionButton: SpeedDial(
  backgroundColor: Colors.transparent,
  foregroundColor: Colors.blue[700],
  overlayColor: Colors.black54,
  buttonSize: Size(48, 48),
  icon: Icons.add,
  activeIcon: Icons.close,
  visible: true,
  curve: Curves.bounceIn,
  childMargin: EdgeInsets.all(8),
  childrenButtonSize: Size(44, 44),
  spacing: 8,
  children: [
    SpeedDialChild(
      backgroundColor: Colors.blue[700]!.withOpacity(0.9),
      foregroundColor: Colors.white,
      label: "New Invoice",
      onTap: () => Get.to(() => Invoicefirstscreen()),
      child: Icon(Icons.description, size: 18),
    ),
    SpeedDialChild(
      backgroundColor: Colors.blue[700]!.withOpacity(0.9),
      foregroundColor: Colors.white,
      label: "New Proposal",
      onTap: () => Get.to(() => Proposalfirstscreen()),
      child: Icon(Icons.receipt, size: 18),
    ),
    SpeedDialChild(
      backgroundColor: Colors.blue[700]!.withOpacity(0.9),
      foregroundColor: Colors.white,
      label: "New Receipt",
      onTap: () => Get.to(() => Receiptfirstscreen()),
      child: Icon(Icons.payment, size: 18),
    ),
  ],
),
    );
  }

  void _handleMenuSelection(String value, BuildContext context) {
    switch (value) {
      case "invoices":
        Get.to(() => Invoicefirstscreen());
        break;
      case "clients":
        Get.to(() => Clientscreen());
        break;
      case "reports":
        Get.to(() => Reportscreen());
        break;
      case "items":
        Get.to(() => Itemscreen());
        break;
    }
  }
}