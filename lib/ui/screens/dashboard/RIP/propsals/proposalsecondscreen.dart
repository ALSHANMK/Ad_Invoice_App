import 'package:ad_invoice_mobile/controllers/productcontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/propsals/product_serviceedit.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/propsals/proposalthirdscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class Proposalsecondscreen extends StatelessWidget {
  Proposalsecondscreen({super.key});

final Productcontroller productcontroller=Get.put(Productcontroller());
  @override
  Widget build(BuildContext context) {
    final screenheight=MediaQuery.of(context).size.height;
    final screenwidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Proposals",style: TextStyle(fontWeight: FontWeight.bold),
        
        ),
        backgroundColor: Colors.blue,
        
      ),
      body: Column(
       
        children: [
          SizedBox(height: 10,),
          
          SizedBox(
            width: screenwidth/2*1.2,
            child: TextFormField(
              onChanged: (value){
                productcontroller.filterproducts(value);
              },
                  decoration: InputDecoration(
                    hintText: "Search product/service",
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
          ),
          //SizedBox(height: 10,),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container( 

                height: screenheight/2*1.2,
                color: Colors.grey[300],
                child: Obx(()=>ListView.builder(itemCount: productcontroller.filteredproduct.length,
                itemBuilder: (context,index)
                {
                   final product=productcontroller.filteredproduct[index];
                  return Card(
                     elevation: 2,
                     margin: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                     child: ListTile(
                      isThreeLine: true,
                      title: Text(product['name'],style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Price:${product["price"]}"),
                          Text("Quantity:${product["qnty"]}"),
                          Text("Category:${product["category"]}"),
                          
                        ],
                      ),
                      trailing: IconButton(onPressed: ()async{
                      final updated=await  Get.to(()=>ProductServiceedit(),arguments: product);

                      if(updated!=null)
                      {
                        productcontroller.updateproduct(product, updated);
                      }
                      }, icon: Icon(Icons.edit)),
                     ),
                  );
                }))
              
              ),
              
         ),

          SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Custombutton(label: "Clear", onpressed: (){}),
              SizedBox(width: 20,),
              Custombutton(label: "Next", onpressed: (){
                Get.to(Proposalthirdscreen());
              }),
            ],
          ),
        ],
      ),

    );
  }
}