import 'package:ad_invoice_mobile/ui/screens/auth/loginscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/registerscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Launchscreen extends StatelessWidget {
  const Launchscreen({super.key});

   @override
  Widget build(BuildContext context) {
    final bool isMobile=ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    final double logoheight=isMobile? 120:180;
    final double logowidth=isMobile? 200:300;
    final double titlesize=isMobile? 16:20;
    final double sectiotitle=isMobile?12:16;
    final double maxcardwidth=isMobile?double.infinity:760;


    final services=[
      {
        "icon":Icons.receipt_long,
        "title":"Invoice management",
        "desc":"Create and manage professional invoices with branding, items, taxes/discounts, and auto totals; export to PDF, share or print, track status and payments, and send reminders—all with client and catalog management built in"
      },
      {
        "icon":Icons.business_center,
        "title":"Business proposals",
        "desc":"Create polished proposals with branding, detailed line items, flexible pricing (taxes, discounts, and optional add‑ons), and clear terms, then share as a PDF or link for quick client review; track status from draft to acceptance with timestamps, enable approvals, and convert accepted proposals into invoices in one tap—complete with automatic numbering, templates, and client history to speed up repeat work.",
      },
      {
        "icon":Icons.analytics,
        "title":"Business analytics",
        "desc":"Business Analytics provides a clear view of sales and cash flow with real-time dashboards for revenue, taxes, and outstanding balances, plus charts of invoice status, top clients, and best-selling items; filter by date, client, or category, export reports, and track trends like month-over-month growth and aging receivables to guide smarter decisions and follow-ups",
      }
    ];
    
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body:Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/finance.jpg"),fit: BoxFit.cover)
        ),
        child: SafeArea(child: 
 SingleChildScrollView(
  padding: EdgeInsets.symmetric(vertical: 24,horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: maxcardwidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: logowidth,
                    height: logoheight,
                    child: Image.asset("assets/logo.png"),
                  ),
                 
                  Center(child: Text("A total billing solution for your business",style: TextStyle(color: Colors.white,fontSize: titlesize),textAlign: TextAlign.center,),
                  ),
                  SizedBox(height: 10,),
                  Center(child: Text("Our Services",style: TextStyle(color: Colors.white,fontSize: sectiotitle),textAlign: TextAlign.center,)),
                  
                 Column(
                  children: [
                    ...services.map((service)
                    {
                      return Card(
                        
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 6,
                        margin: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [const Color.fromARGB(255, 231, 219, 219),const Color.fromARGB(255, 13, 10, 221)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ExpansionTile(
                            tilePadding: EdgeInsets.symmetric(horizontal: isMobile?12:18,vertical: 6),
                            childrenPadding: EdgeInsets.symmetric(horizontal: isMobile?12:18,vertical: 12),
                            title: Text(service["title"] as String,style: TextStyle(fontWeight: FontWeight.bold,fontSize: isMobile?16:20),),
                            leading: CircleAvatar(radius: isMobile?18:26,backgroundColor: Colors.blue,child: Icon(service["icon"] as IconData,color: Colors.white,size: isMobile?18:26,)),
                            children: [
                              
                              Text(service["desc"] as String,style: TextStyle(fontStyle: FontStyle.italic,color: const Color.fromARGB(255, 53, 51, 51),fontSize: isMobile?14:18),
                              textAlign: TextAlign.justify,
                              
                              ),
                              Image.asset("assets/logo.png")
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                 ),
                    //Center(child: Text("we welcomes you",style: TextStyle(color: Colors.white),),),
                    
              
                  SizedBox(height: 30,),
               isMobile?Column(
                children: [
                  SizedBox(
                    width: 180,
                    child: Custombutton(label: "Signin", onpressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
                    }),
                  ),
                  SizedBox(height: 12,),
                  SizedBox(
                    width: 180,
                    child: Custombutton(label: "Register", onpressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Registerscreen()));
                    }),
                  )
                ],
               )
               :Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 160,
                    child: Custombutton(label: "Signin", onpressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
                    }),
                  ),
                  SizedBox(width: 12,),
                  SizedBox(
                    width: 160,
                    child: Custombutton(label: "Register", onpressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Registerscreen()));
                    }),
                  )
                ],
               ),
              
                ],
              ),
            ),
          ),
        ),

      ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.transparent,
        child: Center(child: Text("© 2025 ADSTRA DIGITAL",style: TextStyle(color: Colors.white),)),
      ),
        
      );
  }
}