import 'package:ad_invoice_mobile/controllers/apicontrollers/usermanagementcontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/usermanagement/assignrolepage.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/usermanagement/usermanagementeditscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/usermanagement/usermanagementsecondscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Usermanagementmainscreen extends StatelessWidget {
  const Usermanagementmainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile=ResponsiveBreakpoints.of(context).smallerThan(TABLET);
      final screenheight=MediaQuery.of(context).size.height;
      final Usermanagementcontroller usermanagementcontroller=Get.find<Usermanagementcontroller>();
    return Scaffold(
      appBar:AppBar(title: Text("User Management"),backgroundColor: Colors.blue,),
      body: Column(
        children: [
           Align(
            alignment: Alignment.centerRight,
             child: ElevatedButton.icon(onPressed: (){
                      Get.to(()=>Assignrolepage());
                    }, label:Text("Create Role",style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    ),icon: Icon(Icons.admin_panel_settings,color: Colors.red,),
                    ),
           ),
          SizedBox(height: 20,),
          Text("Registered Users",style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(
              height: screenheight/2*1.3,
              child: Obx(()=>ListView.builder(
                itemCount: usermanagementcontroller.users.length,
                
                itemBuilder: (context, index) {
                  final user=usermanagementcontroller.users[index];
                 
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                     onLongPress:  () {
                      Get.defaultDialog(
                        title: "Delete User",
                        middleText: "Are you sure about deleting this user? This action cannot be undone.",
                        textConfirm: "Yes, Delete",
                        textCancel: "Cancel",
                        confirmTextColor: Colors.white,
                        buttonColor: Colors.red,
                        onConfirm: ()async {
                          final userid=user['id'];
                          
                         await usermanagementcontroller.deleteus(userid);
                        },
                        onCancel: () {
                              },
                            );
                          },
                      leading: CircleAvatar(
                        
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green[200],
                        child: Icon(Icons.person_2_outlined),
                        
                        
                      ),
                      title: Text(
                        "${user['username']}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("${user['roles']}"),
                      isThreeLine: true,
                      trailing: IconButton(onPressed: (){
                       Get.to(()=>Usermanagementeditscreen());
                      }, icon: Icon(Icons.edit,color: Colors.blue[200],)),
                      
                      onTap: () {
                     
                      },
                    ),
                  );
                },
              ),)
            ),
            SizedBox(height: 20,),
             Container(
          child: Column(
            children: [
              SizedBox(
                width: 200,
                child: Custombutton(label: "Add User", onpressed: (){
                  Get.to(()=>Usermanagementsecondscreen());
                }),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: 200,
                child: Custombutton(label: "Back", onpressed: (){
                  Get.back();
                }),
              )
            ],
          ),
        )
        ],
      ),
      
    );
  }
}