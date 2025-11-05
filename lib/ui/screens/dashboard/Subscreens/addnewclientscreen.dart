import 'package:ad_invoice_mobile/controllers/apicontrollers/createclientcontroller.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/listclientcontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';

class Addnewclientscreen extends StatelessWidget {
  Addnewclientscreen({super.key});

  final Createclientcontroller createclientcontroller=Get.put(Createclientcontroller());
  final Listclientcontroller listclientcontroller=Get.find<Listclientcontroller>();

  @override
  Widget build(BuildContext context) {

    final screenheight=MediaQuery.of(context).size.height;
    final screenwidth=MediaQuery.of(context).size.width;
    final _formkey=GlobalKey<FormState>();

    void submitform()
    {
      if(_formkey.currentState!.validate())
      {
        print("Form is valid");
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Client"),
        backgroundColor: const Color.fromARGB(255, 150, 194, 230),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          
          children: [
              Expanded(
                child: Container(
                  height: screenheight/2*1.2,
                  width: screenwidth,
                  child: ListView(
                        padding: EdgeInsets.all(20),
                        children: [
                          TextFormField(
                            validator: (value) {
                              if(value==null || value.isEmpty)
                              {
                                return "Client name is required";
                              }
                              return null;
                            } ,
                            controller: createclientcontroller.clientnamecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text("Client name"),
                ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            validator: (value) {
                              
                            if(value==null || value.isEmpty )
                            {
                              return "Industry is required";
                            }
                            return null;
                            },
                            controller: createclientcontroller.industrycontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text("Industry"),
                ),
                          ),
                          SizedBox(height: 20,),
                          
                          TextFormField(
                            validator: (value) {
                              if(value==null || value.isEmpty)
                              {
                                return "This field is required";
                              }
                              return null;
                            },
                            controller: createclientcontroller.websitecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text("website"),
                ),
                          ),
                           SizedBox(height: 20,),
                           TextFormField(
                            validator: (value) {
                              if(value==null || value.isEmpty)
                              {
                                return "This field is required";
                              }
                              return null;
                            },
                            controller: createclientcontroller.registercontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text("register number"),
                ),
                          ),
                           SizedBox(height: 20,),
                          TextFormField(
                            validator: (value) {
                              
                            if(value==null || value.isEmpty )
                            {
                              return "Taxid is required";
                            }
                            return null;
                            },
                            controller: createclientcontroller.taxcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text("taxid"),
                ),
                          ),
                           SizedBox(height: 20,),
                          TextFormField(
                            validator: (value) {
                              
                            if(value==null || value.isEmpty )
                            {
                              return "Please provide address 1";
                            }
                            return null;
                            },
                            controller: createclientcontroller.addresscontroller,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text("Address line 1"),
                  alignLabelWithHint: true,
                ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            validator: (value) {
                              
                            if(value==null || value.isEmpty )
                            {
                              return "Please provide address 2";
                            }
                            return null;
                            },
                            controller: createclientcontroller.addresscontroller2,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text("Address line 2"),
                  alignLabelWithHint: true,
                ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            validator: (value) {
                              if(value==null || value.isEmpty)
                              {
                                return "Please provide city";
                              }
                            },
                            controller: createclientcontroller.citycontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text("city"),
                ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            validator: (value) {
                              
                            if(value==null || value.isEmpty )
                            {
                              return "Please provide state";
                            }
                            return null;
                            },
                            controller: createclientcontroller.statecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text("state"),
                ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            validator: (value) {
                              
                            if(value==null || value.isEmpty )
                            {
                              return "Please mention country";
                            }
                            return null;
                            },
                            controller: createclientcontroller.countrycontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text("country"),
                ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            validator: (value) {
                              
                            if(value==null || value.isEmpty )
                            {
                              return "Postal code";
                            }
                            if(!GetUtils.isNum(value))
                            {
                              return "Please enter a valid postal code";
                            }
                            return null;
                            },
                            controller: createclientcontroller.postalcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text("postal code"),
                ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            validator: (value) {
                              
                            if(value==null || value.isEmpty )
                            {
                              return "Please provide phone";
                            }
    
                           if (!GetUtils.isNum(value)) {
                          return "Please enter a valid phone number";
                        }
                        if(value.length!=10)
                        {
                          return "please enter a 10 digit number";
                        }
                            return null;
                            },
                            controller: createclientcontroller.phonecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text("phone"),
                ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            validator: (value) {
                              
                            if(value==null || value.isEmpty )
                            {
                              return "Please provide email";
                            }
                            if(!GetUtils.isEmail(value))
                            {
                              return "Enter a valid email";
                            }
                            return null;
                            },
                            controller: createclientcontroller.emailcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text("email"),
                ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            validator: (value) {
                              if(!GetUtils.isEmail(value!))
                              {
                                return "Please enter a valid email";
                              }
                            },
                            controller: createclientcontroller.supportemailcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text("support email"),
                ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            controller: createclientcontroller.accountmangercontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text("account manager"),
                ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            controller: createclientcontroller.notescontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text("note"),
                ),
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                ),
              ),
              SizedBox(height: 15,),
            
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Custombutton(label: "Discard", onpressed: (){}),
                  SizedBox(width: 20,),
                  Custombutton(label: "Save", onpressed: ()async{
                    await createclientcontroller.createclient();
                    try{
                      
                    if(createclientcontroller.issucess.value)
                    {
                      listclientcontroller.getclients();
                        createclientcontroller.clearfield();
                        Get.snackbar("✅Success", "Client created succesfully!!",backgroundColor: Colors.green[200]);
                    }
                    else{
                      submitform();
                      Get.snackbar("❌Error", "Looks like you have given wrong info or empty field",backgroundColor: Colors.red[200]);
                    }
                    
                    }
                    catch(e)
                    {
                      Get.snackbar("this error", "$e");
                    }
                  }),
                ],
              )
          ],
        ),
      )
      
    );
  }
}