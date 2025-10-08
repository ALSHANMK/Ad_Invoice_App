import 'package:flutter/material.dart';

class Proposalthirdscreen extends StatelessWidget {
  const Proposalthirdscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenheight=MediaQuery.of(context).size.height;
    //final screenwidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Proposals",style: TextStyle(fontWeight: FontWeight.bold),),
      backgroundColor: Colors.blue,
      
      ),
      body: Column(
        children: [
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: screenheight/2*1.3,
              color: Colors.grey[300],
              child: InteractiveViewer(
                minScale: 1.0,
                maxScale: 3.0,
                child: Image.asset("assets/receipt.jpg"))
            ),
          ),
        SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(onPressed: (){}, label: Text("Download"),icon: Icon(Icons.download,color: Colors.green,size: 30,), ),
              SizedBox(width: 5,),
              ElevatedButton.icon(label: Text("Print"),onPressed: (){},icon: Icon(Icons.print,color: Colors.blue,size: 30,),),
               SizedBox(width: 5,),
              ElevatedButton.icon(onPressed: (){}, label: Text("Mail"),icon: Icon(Icons.mail,color: Colors.red,size: 30,),)
            ],
          )
        ],
      ),
    );
  }
}