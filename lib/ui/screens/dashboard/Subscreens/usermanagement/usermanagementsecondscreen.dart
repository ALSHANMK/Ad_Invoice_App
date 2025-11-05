import 'package:ad_invoice_mobile/controllers/apicontrollers/usermanagementcontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Usermanagementsecondscreen extends StatelessWidget {
  const Usermanagementsecondscreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    final screenheight=MediaQuery.of(context).size.height;
    final screenwidth=MediaQuery.of(context).size.width;
    final formkey=GlobalKey<FormState>();
    final Usermanagementcontroller usermanagementcontroller=Get.put(Usermanagementcontroller());
    
    return Scaffold(
      appBar: AppBar(title: Text("User Management"),
      backgroundColor: Colors.blue,),
      body: Form(
        key: formkey,
        child: Column(
          
          children: [
              Expanded(
                child: SizedBox(
                  height: screenheight/2*1.2,
                  width: screenwidth,
                  child: ListView(
                        padding: EdgeInsets.all(20),
                        children: [
                          TextFormField(
                            controller: usermanagementcontroller.usernamecontroller,
                            validator: (value) {
                              if(value==null || value.isEmpty)
                              {
                                return "User name is required";
                              }
                              return null;
                            } ,
                            
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text("User name"),
                ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            controller: usermanagementcontroller.emailcontroller,
                            validator: (value) {
                              
                            if(value==null || value.isEmpty )
                            {
                              return "email required";
                            }
                            return null;
                            },
                           
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text("Email"),
                ),
                          ),
                          SizedBox(height: 20,),
                          
                          TextFormField(
                            controller: usermanagementcontroller.passwordcontroller,
                            validator: (value) {
                              if(value==null || value.isEmpty)
                              {
                                return "This field is required";
                              }
                              return null;
                            },
                           
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text("Password"),
                ),
                          ),
                          SizedBox(height: 20,),
                     TextFormField(
                      controller: usermanagementcontroller.firstnamecontroller,
                            validator: (value) {
                              if(value==null || value.isEmpty)
                              {
                                return "This field is required";
                              }
                              return null;
                            },
                           
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text("Firstname"),
                ),
                          ),
                
                          SizedBox(height: 20,),
                          TextFormField(
                            controller: usermanagementcontroller.lastnamecontroller,
                            validator: (value) {
                              if(value==null || value.isEmpty)
                              {
                                return "This field is required";
                              }
                              return null;
                            },
                           
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text("Lastname"),
                ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            controller: usermanagementcontroller.rolecontroller,
                            validator: (value) {
                              if(value==null || value.isEmpty)
                              {
                                return "This field is required";
                              }
                              return null;
                            },
                           
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text("Role"),
                ),
                          ),

                        ],
                      ),
                ),
              ),
              SizedBox(height: 15,),
            
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Custombutton(label: "Discard", onpressed: (){
                    Get.back();
                  }),
                  SizedBox(width: 20,),
                 Custombutton(label: "Save", onpressed: ()async{
                 await usermanagementcontroller.createus();
                 if(usermanagementcontroller.issuccess.value)
                 {
                  usermanagementcontroller.clearfield();
                 }
                 else{
                  Get.snackbar("Sorry", "please try again");
                 }
                 }),
                ],
              )
          ],
        ),
      ),
    );
  }
}