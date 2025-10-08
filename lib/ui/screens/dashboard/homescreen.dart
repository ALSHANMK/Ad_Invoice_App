import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
   Homescreen({super.key});

  final List<Map<String, String>> clients = [
    {"name": "Client 1", "email": "client1@example.com", "phone": "9876543210"},
    {"name": "Client 2", "email": "client2@example.com", "phone": "9876501234"},
    {"name": "Client 3", "email": "client3@example.com", "phone": "9876512345"},
    {"name": "Client 4", "email": "client3@example.com", "phone": "9876512345"},
    {"name": "Client 5", "email": "client3@example.com", "phone": "9876512345"},
    {"name": "Client 6", "email": "client3@example.com", "phone": "9876512345"},
  ];

  @override
  Widget build(BuildContext context) {

    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    return DefaultTabController(length: 3, 
    child: Column(

      children: [
        SizedBox(height: 20,),
        Row(
          children: [

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 138, 178, 248)
              ),
              height: 150,
              width: screenwidth,
             
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                  ),
                  height: 60,
                  width: 80,
                  
                  child: Icon(Icons.apple),
                ),
                SizedBox(width: 20,),
                Container(
                  decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   color: Colors.white
                  ),
                  height: 60,
                  width: 80,
                  
                  child: Icon(Icons.android),
                ),
                SizedBox(width: 20,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                  ),
                  height: 60,
                  width: 80,
                  
                  child: Icon(Icons.facebook),
                ),
               ],
              ),
            ),
          ],
        ),
        SizedBox(height: 15,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 88, 184, 221),
          ),
          height: screenheight/2,
          width: screenwidth,
          
          child:  ListView.builder(
      itemCount: clients.length,
      itemBuilder: (context, index) {
        final client = clients[index];
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(client["name"]![0]),
            ),
            title: Text(
              client["name"]!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("${client["email"]}\n${client["phone"]}"),
            isThreeLine: true,
            trailing: Icon(Icons.arrow_forward_ios, size: 16, color: const Color.fromARGB(255, 158, 158, 158)),
            onTap: () {
              print("Tapped ${client["name"]}");
            },
          ),
        );
      },
    ),
        )
      ],
    
    ),
    
    );
  }
}