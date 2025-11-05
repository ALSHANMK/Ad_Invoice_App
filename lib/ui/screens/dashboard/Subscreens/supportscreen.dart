import 'package:ad_invoice_mobile/controllers/apicontrollers/notificationandsupportcontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class Supportscreen extends StatelessWidget {
  const Supportscreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    final screenheight=MediaQuery.of(context).size.height;
    final screenwidth=MediaQuery.of(context).size.width;
    final TextEditingController subjectcontroller=TextEditingController();
    final TextEditingController descriptioncontroller=TextEditingController();
    final Notificationandsupportcontroller notificationcontroller=Get.find<Notificationandsupportcontroller>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Support"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SizedBox(
                height: screenheight*0.1,
                width: screenwidth*0.7,
                child:TextField(
                  controller: subjectcontroller,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    hintText: "subject",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    alignLabelWithHint: true,
                    contentPadding: EdgeInsets.all(16.0),
                  ),
                ) ,
              ),
            ),
            
          ),
          SizedBox(height: 20,),
           Center(
              child: SizedBox(
                height: screenheight*0.3,
                width: screenwidth*0.7,
                child:TextField(
                  controller: descriptioncontroller,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    hintText: "Description",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    alignLabelWithHint: true,
                    contentPadding: EdgeInsets.all(16.0),
                  ),
                ) ,
              ),
            ),
             SizedBox(height: 20,),
          Custombutton(label: "Submit Ticket", onpressed: ()async{

            if(subjectcontroller.text.isEmpty || descriptioncontroller.text.isEmpty)
            {
              Get.snackbar("Empty fields", "Please fill the fields");
            }
            else{
              await notificationcontroller.submitsupo(subjectcontroller.text, descriptioncontroller.text);
              subjectcontroller.clear();
              descriptioncontroller.clear();
            }
          }),
        ],
      ),

    );
  }
}