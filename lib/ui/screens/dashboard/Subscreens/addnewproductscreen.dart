import 'package:ad_invoice_mobile/controllers/apicontrollers/addproductcontroller.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/productlistcontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class Addnewproductscreen extends StatelessWidget {
  const Addnewproductscreen({super.key});

  @override
  Widget build(BuildContext context) {

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
    final screenheight=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Add new item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Add your products details here",style: TextStyle(fontWeight: FontWeight.bold),),
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
                          return "Please provide type of product";
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
                        label: Text("Enter item Category"),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller:addproductcontroller.namecontroller ,
                      validator: (value) {
                        if(value==null || value.isEmpty)
                        {
                          return "Please enter item name";
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        label: Text("Enter item name"),
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
                        label: Text("Description"),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: addproductcontroller.pricecontroller,
                      validator: (value) {
                        if(value==null || value.isEmpty)
                        {
                          return "Price is required";
                        }
                        if(double.tryParse(value)==null)
                        {
                          return "Please enter a valid price";
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        label: Text("Price"),
                      ),
                    ), 
                    
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: addproductcontroller.stockquantity,
                      validator: (value) {
                        if(value==null || value.isEmpty)
                        {
                          return "Please Mention Quantity";
                        }
                        if(double.tryParse(value)==null)
                        {
                          return "Please give a valid quantity";
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        label: Text("Quantity"),
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
                        Custombutton(label: "Discard", onpressed: ()async{
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
                              throw "Error $e";
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