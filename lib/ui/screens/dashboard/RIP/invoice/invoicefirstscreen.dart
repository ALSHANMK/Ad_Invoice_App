import 'package:ad_invoice_mobile/controllers/apicontrollers/getproposalcontroller.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/proposalcreationcontroller.dart';
import 'package:ad_invoice_mobile/controllers/dropdowncontroller.dart';
import 'package:ad_invoice_mobile/controllers/radiobuttoncontroller.dart';
import 'package:ad_invoice_mobile/controllers/userscontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/invoice/emergency_invoice.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/invoice/invoicesecondscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Invoicefirstscreen extends StatelessWidget {
  const Invoicefirstscreen({super.key});

  @override
  Widget build(BuildContext context) {
  final Dropdowncontroller dropdowncontroller=Get.put(Dropdowncontroller());
  final Userscontroller userscontroller=Get.find<Userscontroller>();
  final TextEditingController searchcontroller=TextEditingController();
  final Getproposalcontroller getproposalcontroller=Get.put(Getproposalcontroller());
    

    final screenheight=MediaQuery.of(context).size.height;
    final screenwidth=MediaQuery.of(context).size.width;
    
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
                      controller: searchcontroller,
                      onChanged: (value) => {
                        userscontroller.filtering(value)
                      },
                      
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
          Expanded(
            flex: 2,
            child: Obx((){
              final hassearch=searchcontroller.text.isNotEmpty;
              final hasclient=userscontroller.filteredusers.isNotEmpty;
              
              if(!hassearch)
              {
                return Center(
                  child: Column(
                      children: [
                        Text("Search Clients above",style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),)
                      ],
                  ),
                );
              }
              if(!hasclient)
              {
                return Center(
                  child: Column(
                    children: [
                        Text("Sorry,no clients has been found on that name",style: TextStyle(
                          color: Colors.red,fontWeight: FontWeight.bold
                        ),),
                    ],
                  ),
                );
              }
             return  ListView.builder(
              itemCount: userscontroller.filteredusers.length,
              itemBuilder: (context,index)
            {
              
              final client=userscontroller.filteredusers[index];
              final userid=client['id'];
              return Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Client Details",style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 8,),
                 Obx((){
                  final isselected=userscontroller.selecteduser.value==index;
                    return ListTile(
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                       onTap: ()async{
                       try{
             userscontroller.selection(index);
          await Future.delayed(Duration(milliseconds: 50));
          await getproposalcontroller.getprop(userid);
   
                       }
                       catch(e)
                       {
                        Get.snackbar("Error in getting proposal", "$e");
                       }
                        

                       },
                      tileColor: isselected?Colors.blue[100]:Colors.white,
                      trailing: isselected?Icon(Icons.check_rounded,color: Colors.green,):Icon(Icons.check_box_outline_blank),
                      contentPadding: EdgeInsets.zero,
             title: Text("${client['name']} | ${client['location']}"),
             
              
            );
                 })
                  ],
                ),
              ),
            );
            });
            }),
          ),
              Obx(()=> Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                      items:getproposalcontroller.proposal.isEmpty 
      ? [DropdownMenuItem(value: null, child: Text("No proposals available"))]
      : getproposalcontroller.proposal.map<DropdownMenuItem<String>>((proposalItem) {
          return DropdownMenuItem<String>(
            
            value: proposalItem['id']?.toString(),
            child: Text(
              "${proposalItem['proposal_number']} - ${proposalItem['title']}",
              style: TextStyle(fontSize: 14),
            ),
          );
        }).toList(),
                      ),
                ),
              ),

              ),

            SizedBox(height: 15,), 
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Custombutton(label: "Cancel", onpressed: (){}),
                SizedBox(width: 15,),
               Custombutton(label: "Next", onpressed: () async {
              final selectedid = dropdowncontroller.selectedvalue.value;
              
              
              try {
                if (selectedid != null && selectedid.isNotEmpty) {
                  final items = await getproposalcontroller.getpropitem(selectedid);
                  final selectedindex = userscontroller.selecteduser.value;
                  final selectedclient = userscontroller.filteredusers[selectedindex];
                  
                  Get.to(Invoicesecondscreen(), arguments: {
                    'items': items,
                    'clients': selectedclient,
                  });
                }
              } catch (e) {
                
              }
            })
              ],
            ),
          ),
          
        ],
      ),
    );
    
  }
}