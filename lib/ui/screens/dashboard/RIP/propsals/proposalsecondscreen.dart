import 'package:ad_invoice_mobile/controllers/productcontroller.dart';
import 'package:ad_invoice_mobile/controllers/radiobuttoncontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/propsals/product_serviceedit.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/propsals/proposalpreviewscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/propsals/proposalthirdscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Proposalsecondscreen extends StatelessWidget {
  Proposalsecondscreen({super.key});



  @override
  Widget build(BuildContext context) {
    final Radiobuttoncontroller radiobuttoncontroller=Get.put(Radiobuttoncontroller());
   
    Map<String,dynamic> user=Get.arguments;
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
                radiobuttoncontroller.filtering(value);
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
                child: Obx(()=>ListView.builder(itemCount: radiobuttoncontroller.items.length,
                itemBuilder: (context,index)
                {
                   final product=radiobuttoncontroller.items[index];
                  return Card(
                     elevation: 2,
                     margin: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                     child:Obx((){

                      final isselected=radiobuttoncontroller.selecteditemindex.contains(index);
                      return ListTile(
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onTap: ()=>radiobuttoncontroller.selections(index),
                        tileColor: isselected?Colors.green[200]:Colors.grey[200],
                      isThreeLine: true,
                      title: Text(product['name'],style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if(product['Category']=='Product')
                          ...[
                            Text("Price:${product["Price"]}"),
                          Text("Quantity:${product["Qnty"]}"),
                          Text("Category:${product["Category"]}",style: TextStyle(fontWeight: FontWeight.bold),),
                          ]
                          else if(product['Category']=='Service')
                          ...[
                            Text("Rate per hour:${product["Rate"]}"),
                          Text("Workers:${product["Workers"]}"),
                          Text("Category:${product["Category"]}",style: TextStyle(fontWeight: FontWeight.bold),),
                          ]
                          
                        ],
                      ),
                      trailing: isselected?Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.check_box_rounded,color: Colors.green,),
                          IconButton(onPressed: () async{
                          final updated=await Get.to(()=>ProductServiceedit(),arguments: product);
                              
                            if(updated!=null)
                            {
                                radiobuttoncontroller.updated(product, updated);
                            }
                            
                          }, icon: Icon(Icons.edit,color: Colors.blue,),),
                        ],
                      ):Icon(Icons.circle_outlined,color: Colors.grey,)
                     );
                     }) 
                  );
                }
                ),
                ),
              
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

                var selecteditems=radiobuttoncontroller.selecteditemindex.map((i)=>radiobuttoncontroller.items[i]).toList();
                Get.to(()=>Proposalpreviewscreen(),arguments: {
                  'items':selecteditems,
                  'clients':user,
                });
              }),
            ],
          ),
        ],
      ),

    );
  }
}