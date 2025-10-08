import 'package:flutter/material.dart';

class Transactionscreen extends StatefulWidget {
  const Transactionscreen({super.key});

  @override
  State<Transactionscreen> createState() => _TransactionState();
}

class _TransactionState extends State<Transactionscreen> {

  final List<Map<String,dynamic>> transactions=[

    {
      "id":"001",
      "Client":"Amal",
      "Amount":"300",
      "Status":"Pending",
      "Date":"18-07-25"
    },
    
    {
      "id":"002",
      "Client":"Arun",
      "Amount":"500",
      "Status":"Paid",
      "Date":"02-09-25"
    },
    
    {
      "id":"003",
      "Client":"Rahul",
      "Amount":"700",
      "Status":"Paid",
      "Date":"11-08-25"
    },
    
    {
      "id":"004",
      "Client":"Shukoor",
      "Amount":"200",
      "Status":"Pending",
      "Date":"28-09-25"
    }

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        title: Text("Transactions",style: TextStyle(color: Colors.grey[400]),
        ),
      ),
      body: ListView.builder(itemCount: transactions.length,
      padding: EdgeInsets.all(20),
      itemBuilder: (context,index)
      {
        final txn=transactions[index];
        return Card(
          elevation: 6,
          child: ListTile(
            leading: Icon(Icons.receipt),
            title: Text(txn["Client"],style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("ID:${txn["id"]} | Date:${txn["Date"]}"),
            trailing: Column(
              children: [
                Text("Amount:${txn["Amount"]}",
                ),
                Text("Status:${txn["Status"]}",style: TextStyle(color: 
                txn["Status"]=="Paid"?Colors.green:txn["Status"]=="Pending"?Colors.red:Colors.orange),)
              ],
            ),
            
          ),
        );
      })
    );
  }
}

