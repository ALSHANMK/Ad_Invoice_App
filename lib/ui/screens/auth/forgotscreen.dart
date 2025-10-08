import 'package:ad_invoice_mobile/ui/screens/auth/messagescreen.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/customforfield.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Forgotscreen extends StatefulWidget {
  const Forgotscreen({super.key});

  @override
  State<Forgotscreen> createState() => _ForgotscreenState();
}

class _ForgotscreenState extends State<Forgotscreen> {

  final TextEditingController textEditingController=new TextEditingController();
  String _otp="3322";
  String _message="";

  void sendotp()
  {
    setState(() {
      _otp=3322.toString();
      _message="OTP send to your mail!";
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_message)));
      textEditingController.clear();
    });

  }

  void verify(){
    if(textEditingController.text == _otp)
    {
      setState(() {
        _message="✅ OTP is correct!";
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_message)));
    }
    else{
      setState(() {
        _message="❌ OTP is incorrect!";
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    Widget forgotForm = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Logo
        Image.asset(
          'assets/logo.png',
          width: isMobile ? 50 : 80,
          height: isMobile ? 70 : 100,
        ),

        const SizedBox(height: 20),

        /// Title
        Center(
          child: Text(
            "Verify",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 20 : 26,
              color: Colors.grey,
            ),
          ),
        ),

        const SizedBox(height: 10),

        Text(
          "Enter your email and mobile to verify",
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: isMobile ? 14 : 16),
        ),

        const SizedBox(height: 20),

        /// Email + OTP row
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Customforfield(
                hinttext: "example@mail.com",
                prefixicon: Icons.mail,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: Custombutton(label: "OTP", onpressed: () {
                sendotp();
              }),
            ),
          ],
        ),

        const SizedBox(height: 20),

        /// Email OTP input
        Customforfield(
          controller: textEditingController,
          hinttext: "Enter the OTP",
          prefixicon: Icons.near_me,
          onchanged: (value)
          {
            if(value.length==4)
            {
              verify();
            }
          },
          
        ),


        const SizedBox(height: 20),

        /// Mobile + OTP row
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Customforfield(
                hinttext: "Enter your mobile",
                prefixicon: Icons.phone_android,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: Custombutton(label: "OTP", onpressed: () {}),
            ),
          ],
        ),

        const SizedBox(height: 20),

        /// Mobile OTP input
        Customforfield(
          hinttext: "Enter the OTP",
          prefixicon: Icons.near_me,
        ),

        const SizedBox(height: 40),

        /// Submit button
        SizedBox(
          width: double.infinity,
          child: Custombutton(
            label: "Submit",
            onpressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Messagescreen()));
            },
          ),
        ),
      ],
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          /// Background image
          Positioned.fill(
            child: Image.asset(
              "assets/finance.jpg",
              fit: BoxFit.fill,
            ),
          ),

          /// Form
          Align(
            alignment: const Alignment(0, -0.6),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: isMobile
                  ? forgotForm
                  : Center(
                      child: Card(
                        color: Colors.black.withOpacity(0.5),
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: SizedBox(
                            width: ResponsiveValue<double>(
                              context,
                              defaultValue: MediaQuery.of(context).size.width * 0.8,
                              conditionalValues: [
                                Condition.smallerThan(name: TABLET, value: MediaQuery.of(context).size.width * 0.9),
                                Condition.largerThan(name: DESKTOP, value: 600),
                              ],
                            ).value,
                            child: forgotForm,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),

      /// Footer
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.transparent,
        child: Center(
          child: Text(
            "© 2025 ADSTRA DIGITAL",
            style: TextStyle(
              color: const Color.fromARGB(255, 43, 40, 40),
              fontSize: isMobile ? 12 : 14,
            ),
          ),
        ),
      ),
    );
  }
}
