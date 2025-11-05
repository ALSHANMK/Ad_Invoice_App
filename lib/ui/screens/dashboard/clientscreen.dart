import 'package:ad_invoice_mobile/controllers/apicontrollers/listclientcontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/addnewclientscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/clientfulldetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class Clientscreen extends StatelessWidget {
  Clientscreen({super.key});

 

  final Listclientcontroller listclientcontroller=Get.put(Listclientcontroller());

  @override
  Widget build(BuildContext context) {
  final screenheight=MediaQuery.of(context).size.height;
    
    return Column(
      children: [
        Container(
          height: screenheight/2*1.3,
          child: ListView.builder(
            itemCount: listclientcontroller.sortedclients.length,
            itemBuilder: (context, index) {
              final client = listclientcontroller.sortedclients[index];
              return Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: CircleAvatar(
                    
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person_2_outlined),
                    
                    
                  ),
                  title: Text(
                    client["name"]!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("${client["email"]}\n${client["phone"]}"),
                  isThreeLine: true,
                  trailing: IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Addnewclientscreen()));
                  }, icon: Icon(Icons.edit)),
                  
                  onTap: () {
                   Get.to(()=>Clientfulldetails(),arguments: client);
                  },
                ),
              );
            },
          ),
        ),
        SizedBox(height: 40,),
        Container(
          child: Column(
            children: [
              SizedBox(
                width: 200,
                child: Custombutton(label: "Add new Client", onpressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Addnewclientscreen()));
                }),
              )
            ],
          ),
        )
      ],
    );
  }
}