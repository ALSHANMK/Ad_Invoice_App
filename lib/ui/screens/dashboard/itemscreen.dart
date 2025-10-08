import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/addnewproductscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/addnewservicescreen.dart';
import 'package:flutter/material.dart';

class Itemscreen extends StatelessWidget {
  const Itemscreen({super.key});

  @override
  Widget build(BuildContext context) {

    final screenheight=MediaQuery.of(context).size.height;

    final List<String> products=["Soap","Shampoo","Conditioner"];
    final List<String> services=["Plumbing","Carpentary","Painting"];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey
          ,tabs:[
            Tab(text: "Product",),
            Tab(text: "Service",),
          ]),
        ),
        body: TabBarView(children: [
          Column(
            children: [
              SizedBox(
                height: screenheight/2*1.2,
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context,index)
                {
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      leading: Icon(Icons.shopping_bag),
                      title: Text(products[index]),
                    ),
                  );
                }),
              ),
              SizedBox(
                  width: 200,
                  child: Custombutton(label: "Add new product", onpressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Addnewproductscreen()));
                  }),
                ),
            ],
          ),
          

          Column(
            children: [
              SizedBox(
                height: screenheight/2*1.2,
                child: ListView.builder(
                  
                  itemCount: services.length,
                  itemBuilder: (context,index)
                {
                  return Card(
                    margin: EdgeInsets.all(20),
                    child: ListTile(
                      leading: Icon(Icons.home_repair_service),
                      title: Text(services[index]),
                    ),
                  );
                }),
              ),
               SizedBox(
                  width: 200,
                  child: Custombutton(label: "Add new service", onpressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Addnewservicescreen()));
                  }),
                ),
            ],
          ),
         
          
        ]
        
        ),
        
        
      ),
      
    );
    
  }
}