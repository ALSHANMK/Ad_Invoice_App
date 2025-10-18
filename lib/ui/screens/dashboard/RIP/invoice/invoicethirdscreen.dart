import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/invoice/previewscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/receipt/receiptfirstscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Invoicethirdscreen extends StatelessWidget {
 const Invoicethirdscreen({super.key});

    
  @override
  Widget build(BuildContext context) {
final screenheight=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview of Template",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: InteractiveViewer(
                minScale: 1.0,
                maxScale: 3.0,
                child: SizedBox(
                  height: screenheight*0.82,
                  child:Previewscreen(printbutton: false,)
                    ),
              ),
            ),
            SizedBox(height: 5,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(onPressed: (){
                Get.to(()=>Receiptfirstscreen());
              }, label: Text("Download"),icon: Icon(Icons.download,color: Colors.green,size: 30,), ),
              SizedBox(width: 5,),
              ElevatedButton.icon(label: Text("Print"),onPressed: (){},icon: Icon(Icons.print,color: Colors.blue,size: 30,),),
               SizedBox(width: 5,),
              ElevatedButton.icon(onPressed: (){}, label: Text("Mail"),icon: Icon(Icons.mail,color: Colors.red,size: 30,),)
            ],
          )
          ],
        ),
      )

    );
  }
}