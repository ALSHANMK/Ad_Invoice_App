import 'package:ad_invoice_mobile/ui/screens/auth/forgotscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/loginscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/customforfield.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Registerscreen extends StatelessWidget {
  const Registerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    Widget registerForm = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Logo
        Image.asset(
          'assets/logo.png',
          width: isMobile ? 120 : 180,
          height: 150,
          fit: BoxFit.contain,
        ),

        const SizedBox(height: 10),

        /// Greeting Text
        Text(
          "Greetings, we are excited for a new partnership",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 14 : 18,
          ),
        ),

        const SizedBox(height: 30),

        /// Register Title
        Text(
          "Register",
          style: TextStyle(
            color: Colors.grey,
            fontSize: isMobile ? 18 : 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        /// Form Fields
        const Customforfield(
          hinttext: "Enter your full name",
          prefixicon: Icons.supervised_user_circle,
        ),
        const SizedBox(height: 20),
        const Customforfield(
          hinttext: "Enter your company name",
          prefixicon: Icons.account_balance,
        ),
        const SizedBox(height: 20),
        const Customforfield(
          hinttext: "Enter company location",
          prefixicon: Icons.map,
        ),
        const SizedBox(height: 40),

        /// Next Button
        SizedBox(
          width: double.infinity,
          child: Custombutton(
            label: "Next",
            onpressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Forgotscreen()));
            },
          ),
        ),

        const SizedBox(height: 20),

        /// Already have account link
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Loginscreen()));
          },
          child: const Text(
            "Already have an account?",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
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
            alignment: const Alignment(0, -0.7),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: isMobile
                  ? registerForm
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
                            child: registerForm,
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
        height: 50,
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
