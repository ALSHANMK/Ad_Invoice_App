import 'package:ad_invoice_mobile/controllers/apicontrollers/rolecontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/usermanagement/createrolepage.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/usermanagement/editrole.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Listroles extends StatelessWidget {
   Listroles({super.key});

  final Rolecontroller rolecontroller=Get.find<Rolecontroller>();

  @override
  Widget build(BuildContext context) {
    
    
   
     final screenheight=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:AppBar(title: Text("User Management"),backgroundColor: Colors.blue,),
      body: 
      Column(
        children: [
          SizedBox(height: 20,),
          Text("Roles",style: TextStyle(fontWeight: FontWeight.bold),),
          Expanded(
            child: SizedBox(
                height: screenheight/2*1.3,
                child:Obx(()=>ListView.builder(
                  itemCount: rolecontroller.roles.length,
                  itemBuilder: (context, index) {
                    final role=rolecontroller.roles[index];
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                       onLongPress:  () {
                        Get.defaultDialog(
                          title: "Delete Role",
                          middleText: "Are you sure about deleting this Role? This action cannot be undone.",
                          textConfirm: "Yes, Delete",
                          textCancel: "Cancel",
                          confirmTextColor: Colors.white,
                          buttonColor: Colors.red,
                          onConfirm: ()async {
                            Get.back();
                          await rolecontroller.deletero(role['id']);
                       
                          },
                          onCancel: () {
                            Get.back();
                                },
                              );
                            },
                        leading: CircleAvatar(
                          
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red[500],
                          child: Icon(Icons.shield),
                        ),
                        title: Text(
                          "${role['name']}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        
                       subtitle: Text("${role['description']}"),
                        trailing: IconButton(onPressed: (){
                         Get.to(()=>Editrole(),arguments: role['id']);
                        }, icon: Icon(Icons.settings,color: Colors.black,)),
                        
                        onTap: () {
                       
                        },
                      ),
                    );
                  },
                ),)
              ),
          ),
            SizedBox(height: 10,),
           Column(
            children: [
              SizedBox(
                width: 200,
                child: ElevatedButton.icon(onPressed: (){
                  Get.to(Createrolepage());
                }, label: Text("Create new Role",style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                icon: Icon(Icons.shield_moon_sharp,color: Colors.red,),)
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

        ],
      ),
      
    );
  }
}