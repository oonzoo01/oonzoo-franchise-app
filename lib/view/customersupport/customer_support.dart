import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/custom_bottombar.dart';
import '../widget/logo_widget.dart';
import '../widget/register_formfeild.dart';

class CustomerSupportScreen extends StatelessWidget {
  CustomerSupportScreen({super.key});
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kwhite,
      // drawer: const SDNavigationDrawer(),
      appBar: AppBar(
        elevation: 0.5,
        title: const Text(
          'Support',
          style: TextStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              color: IconTheme.of(context).color!.withOpacity(0.05),
              child: const LogoWidget(
                mainAxisAlignment: MainAxisAlignment.center,
                widthFactor: 4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: Form(
                key: globalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Write to us your queries',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Will get back to you soon',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    RegisterFormFeild(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      prefix: Icons.phone,
                      labelText: 'PHONE NUMBER',
                      validator: (val) {
                        if (val!.length >= 9) {
                          return 'Enter valid number';
                        }
                        if (val.isEmpty) {
                          return "Phone number requried *";
                        }
                        return null;
                      },
                    ),
                    RegisterFormFeild(
                      controller: messageController,
                      prefix: Icons.mail_outline,
                      labelText: 'YOUR MESSAGE',
                      hintText: 'Enter Your Message Here',
                      maxLine: 5,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Message requried *";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        onTap: () {
          if (globalKey.currentState!.validate()) {
            Navigator.pop(context);
          }
        },
        text: 'Submit',
      ),
    );
  }
}
