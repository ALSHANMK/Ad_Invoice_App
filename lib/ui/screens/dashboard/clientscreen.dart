import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/addnewclientscreen.dart';
import 'package:flutter/material.dart';

class Clientscreen extends StatelessWidget {
  Clientscreen({super.key});

  

  final List<Map<String, String>> clients = [
    {"name": "Client 1", "email": "Company 1", "phone": "Kozhikode"},
    {"name": "Client 2", "email": "Company 2", "phone": "Thrissur"},
    {"name": "Client 3", "email": "Company 3", "phone": "Kochi"},
    {"name": "Client 4", "email": "Company 4", "phone": "Kozhikode"},
    {"name": "Client 5", "email": "Company 5", "phone": "Kollam"},
    {"name": "Client 6", "email": "Company 6", "phone": "Idukki"},
  ];

  @override
  Widget build(BuildContext context) {
  final screenheight=MediaQuery.of(context).size.height;
    
    return Column(
      children: [
        Container(
          height: screenheight/2*1.3,
          child: ListView.builder(
            itemCount: clients.length,
            itemBuilder: (context, index) {
              final client = clients[index];
              return Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: CircleAvatar(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 226, 62, 62),
                    child: Text(client["name"]![0]),
                    
                    
                  ),
                  title: Text(
                    client["name"]!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("${client["email"]}\n${client["phone"]}"),
                  isThreeLine: true,
                  trailing: IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Addnewclientscreen()));
                  }, icon: Icon(Icons.edit)),
                  
                  onTap: () {
                    print("Tapped ${client["name"]}");
                  },
                ),
              );
            },
          ),
        ),
        SizedBox(height: 40,),
        Container(
          child: Column(
            children: [
              SizedBox(
                width: 200,
                child: Custombutton(label: "Add new Client", onpressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Addnewclientscreen()));
                }),
              )
            ],
          ),
        )
      ],
    );
  }
}