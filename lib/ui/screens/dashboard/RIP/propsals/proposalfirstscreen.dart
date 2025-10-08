import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/propsals/proposalsecondscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class Proposalfirstscreen extends StatelessWidget {
   Proposalfirstscreen({super.key});

  final List<Map<String,dynamic>> clients=[
    {
        "name":"John",
        "Company":"Microsoft",
        "Location":"Hyderabad",
        "age": 32,
    },
  ];

  @override
  Widget build(BuildContext context) {
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
              ),
            ),

       

          Container(
            height: screenheight/2,
            color: Colors.grey[300],
            child: ListView.builder(itemCount: clients.length,
              itemBuilder: (context,index)
            {
              final client=clients[index];
              return Card(
                  elevation: 6,
                  margin: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                  child: ListTile(
                    isThreeLine: true,
                    title: Text("${client["name"]}",style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${client["age"]}"),
                          Text(client["Company"]),
                           Text(client["Location"]),
                            
                      ],
                    ),
                    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.square_outlined)),
                  ),
              );
            })
          ),

          SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 10,),
              Custombutton(label: "Cancel", onpressed: (){}),
              SizedBox(width: 25,),
              Custombutton(label: "Next", onpressed: (){
                Get.to(Proposalsecondscreen());
              })
            ],
          ),
          
        ],
          
        ),

    );
  }
}