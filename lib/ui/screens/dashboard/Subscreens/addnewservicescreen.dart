import 'package:ad_invoice_mobile/controllers/apicontrollers/addproductcontroller.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/productlistcontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addnewservicescreen extends StatelessWidget {
  Addnewservicescreen({super.key});
 final _formkey=GlobalKey<FormState>();
    void submitform()
    {
      if(_formkey.currentState!.validate())
      {
        print("Form is valid");
      }
    }

    final Addproductcontroller addproductcontroller=Get.put(Addproductcontroller());
    final Productlistcontroller productlistcontroller=Get.find<Productlistcontroller>();
  @override
  Widget build(BuildContext context) {
    final screenheight=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Add new Service"),
      ),
     body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Add your Service details here",style: TextStyle(fontWeight: FontWeight.bold),),
              Container(
                height: screenheight/2*1.2,
                child: ListView(
                  children: [
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: addproductcontroller.typecontroller,
                      validator: (value) {
                        if(value==null || value.isEmpty)
                        {
                          return "Please provide type of Service";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        label: Text("Type"),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: addproductcontroller.categorycontroller,
                      validator: (value) {
                        if(value==null || value.isEmpty)
                        {
                          return "Please mention Category";
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        label: Text("Enter Service Category"),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller:addproductcontroller.namecontroller ,
                      validator: (value) {
                        if(value==null || value.isEmpty)
                        {
                          return "Please enter Service name";
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        label: Text("Enter Service name"),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: addproductcontroller.descriptioncontroller,
                      maxLines: 2, 
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        label: Text("Service Description"),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: addproductcontroller.pricecontroller,
                      validator: (value) {
                        if(value==null || value.isEmpty)
                        {
                          return "Rate is required";
                        }
                        if(double.tryParse(value)==null)
                        {
                            return "Please provide a valid rate";
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        label: Text("Rate"),
                      ),
                    ), 
                    
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: addproductcontroller.stockquantity,
                      validator: (value) {
                        if(value==null || value.isEmpty)
                        {
                          return "Mention Workers";
                        }
                        if(double.tryParse(value)==null)
                        {
                          return "Please mention valid no of workers";
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        label: Text("Workers"),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Row(
              children: [
                Checkbox(
                  value: addproductcontroller.isactive.value,
                  onChanged: (value) => addproductcontroller.isactive.value=value!,
                ),
                Text('is Active?'),
                Checkbox(
                  value: addproductcontroller.deliveryavail.value,
                  onChanged: (value) => addproductcontroller.deliveryavail.value=value!,
                ),
                Text('Delivery Available?'),
              ],
            ),),
            
             
          ],
              ),
              SizedBox(height: 10,),
          
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Custombutton(label: "Discard", onpressed: (){
                          Get.back();
                        }),
                        SizedBox(width: 20,),
                        Custombutton(label: "Save", onpressed: ()async{
                          print("Button pressed");
                            if(!_formkey.currentState!.validate())
                            {
                              Get.snackbar("Error", "Please fill all fields");
                              return;
                            }
                            try{
                               await addproductcontroller.additem();
                            if(addproductcontroller.isSuccess.value)
                            {
                              await productlistcontroller.getpro();
                              addproductcontroller.clearfield();
                              
                            
                            
                            }
                            else{
                              submitform();
                               Get.snackbar("Error", "Make sure you gave right info");
                            }
                            }
                            catch(e)
                            {
                              Get.snackbar("Error", "Something went wrong: $e");
                            }
                            
                    })
                      ],
                    ),
                    
                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}