import 'package:ad_invoice_mobile/controllers/dropdowncontroller.dart';
import 'package:ad_invoice_mobile/controllers/radiobuttoncontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/invoice/emergency_invoice.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/invoice/invoicesecondscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Invoicefirstscreen extends StatelessWidget {
  Invoicefirstscreen({super.key});

  @override
  Widget build(BuildContext context) {
  final Dropdowncontroller dropdowncontroller=Get.put(Dropdowncontroller());

    final screenheight=MediaQuery.of(context).size.height;
    final screenwidth=MediaQuery.of(context).size.width;
    final args=Get.arguments;
    
    List<Map<String,dynamic>> items=args['items'];
    Map<String,dynamic> client=args['clients'];
    
    return Scaffold(
      appBar: AppBar(
        title: Text("invoice"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        
        children: [
          Card(
            elevation: 2,
            margin: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: screenwidth/3*1.3,
                    child: TextFormField(
                      
                      decoration: InputDecoration(
                        
                        suffixIcon: Icon(Icons.search),
                        labelText: "Search Client",
                        contentPadding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          
                        )
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12,),
               ElevatedButton.icon(
                icon: Icon(Icons.emergency,color: Colors.red,size: 20,),
                onPressed: (){
                  Get.to(()=>EmergencyInvoice());
                }, label: Text("Emergency"))
              ],
            ),
          ),
           SizedBox(height: 15,),
          Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Client Details",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 8,),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
            title: Text("${client['name']} | ${client['Location']}"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4,),
                Text("Age:${client['age']}"),
                Text('Bank:${client['bank']}'),
              ],
            ),
          ),
                ],
              ),
            ),
          ),
            SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      label: Text("Search Proposal"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                    ),
                  ),
              ),
              SizedBox(width: 3,),

              Obx(()=> Expanded(
                flex: 1,
                child: DropdownButtonFormField<String>(
                    dropdownColor: Colors.grey[200],
                    icon: Icon(Icons.arrow_drop_down),
                    elevation: 6,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                    ),
                    hint: Text("Select proposals",style: TextStyle(fontWeight: FontWeight.bold),),
                    value:dropdowncontroller.selectedvalue.value ,
                    onChanged: dropdowncontroller.changedvalue,
                    items: <String>['Proposal 1', 'Proposal 2', 'Proposal 3', 'Proposal 4']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                        
                      );
                    }).toList(), 
                    ),
              ),

              ),
            ],
          ),
            SizedBox(height: 15,),
        
          Text("Products/Service list"),
           
          Expanded(
            child: Column(
              children: [
                Container(
                  height: screenheight*0.3,
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context,index)
                  {
                    final item=items[index];
                    final isproduct=item['Category']=='Product';
                    return Card(
                        elevation: 3,
                        child: ListTile(
                          isThreeLine: true,
                          title: Text(item['name']),
                          subtitle:isproduct? Text("Price:${item['Price']} \n Quantity:${item['Qnty']}"):Text("Rate${item['Rate']}\nNo of workers${item['Workers']}"),
                        ),
                    );
                  }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Custombutton(label: "Cancel", onpressed: (){}),
                SizedBox(width: 15,),
                Custombutton(label: "Next", onpressed: (){
                  Get.to(Invoicesecondscreen(),arguments: Get.arguments);
                })
              ],
            ),
          ),
          
        ],
      ),
    );
    
  }
}