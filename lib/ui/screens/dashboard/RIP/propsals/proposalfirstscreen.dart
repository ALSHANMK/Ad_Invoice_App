import 'package:ad_invoice_mobile/controllers/userscontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/propsals/proposalsecondscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class Proposalfirstscreen extends StatelessWidget {
   Proposalfirstscreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final Userscontroller userscontroller=Get.put(Userscontroller());
    
    final screenheight=MediaQuery.of(context).size.height;
    final screenwidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Proposals",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body:Column(
        spacing: 10,
        children: [
          SizedBox(height: 10,),
          SizedBox(
              width: screenwidth/2*1.3,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search Client",
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                onChanged: (value) {
                  userscontroller.filtering(value);
                },
              ),
            ),
         Container(
            height: screenheight/2,
            color: Colors.grey[300],
            child:Obx(()=>
            ListView.builder(itemCount: userscontroller.filteredusers.length,
              itemBuilder: (context,index)
            { 
              final client=userscontroller.filteredusers[index];
              return Card(
                  elevation: 6,
                  margin: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                  child:Obx((){
                    final isselected=userscontroller.selecteduser.value==index;
                     return  ListTile(
                    onTap: ()=>userscontroller.selection(index),
                    tileColor: isselected?Colors.green[200]:Colors.grey[200],
                    isThreeLine: true,
                    title: Text("${client["name"]}",style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(client['industry']),
                        Text(client['email']),
                        Text(client['phone']),
                        Text(client['address']),
                        Text(client['Location']),
                      ],
                    ),
                    trailing: isselected?IconButton(onPressed: (){}, icon: Icon(Icons.check_box_rounded,color: Colors.green,)):
                    Icon(Icons.check_box_outline_blank),
                  );
                  })                  
              );
            }),
            ), 
          ),
          SizedBox(height: 20,),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 10,),
              Custombutton(label: "Cancel", onpressed: (){
                Get.back();
              }),
              SizedBox(width: 25,),
              Custombutton(label: "Next", onpressed: (){
                final selecteduser=userscontroller.userinfo;
                if(selecteduser !=null){
                  Get.to(Proposalsecondscreen(),arguments: selecteduser);
                }
                else{
                  Get.snackbar("Error", "Please select a Client",backgroundColor: Colors.blue,snackPosition: SnackPosition.BOTTOM);
                }
              })
            ],
          ),
        ],
        ),

    );
  }
}