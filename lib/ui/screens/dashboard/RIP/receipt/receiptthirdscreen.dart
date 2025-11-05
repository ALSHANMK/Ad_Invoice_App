import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/receipt/recieptpreview.dart';
import 'package:flutter/material.dart';

class Receiptthirdscreen extends StatelessWidget {
  const Receiptthirdscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenheight=MediaQuery.of(context).size.height;
    

    return Scaffold(
      appBar: AppBar(title: Text("Receipt preview"),
      backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: InteractiveViewer(
                maxScale: 3.0,
                minScale: 1.0,
                child: Container(
                   constraints: BoxConstraints(
                    maxHeight: screenheight*0.8
                   ),
                    color: Colors.blue[100],
                    child: Recieptpreview(printbutton: false,),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(onPressed: (){}, label: Text("Download"),icon: Icon(Icons.download,color: Colors.green,size: 30,),),
              ElevatedButton.icon(onPressed: (){}, label: Text("Print"),icon: Icon(Icons.print,color: Colors.red,size: 30,),),
              ElevatedButton.icon(onPressed: (){}, label: Text("Mail"),icon: Icon(Icons.mail,color: Colors.blue,size: 30,),)
            ],
          )
        ],
      ),
    );
  }
}