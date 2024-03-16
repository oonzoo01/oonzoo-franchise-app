import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/constant/size/size.dart';
import 'package:salesapp/view/home/dashboard.dart';
import 'package:salesapp/view/partner_bottom_nav/partner_bottom_nav.dart';

import '../../api/shared_service.dart';
import '../../provider/franchise_member_provider/franchise_member_provider.dart';
import '../../provider/theme_provider.dart';
import '../auth/registration_screen.dart';
import '../widget/logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.type});
  final String type;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ThemeProvider>(context, listen: false).setTheme(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () async {
        final loginResponse = await SharedService.loginDetails();
        if (loginResponse?.partnerRegistered ?? false) {
          // if (widget.type == 'freelancer') {
          //   // ignore: use_build_context_synchronously
          //   Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const DashboardPage(),
          //     ),
          //   );
          // } else {
          // ignore: use_build_context_synchronously
          Provider.of<FranchiseMemberProvider>(context, listen: false)
              .fetchAllFranchiseMember();
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<DashboardPage>(
              builder: (BuildContext context) => const PartnerBottomNav(),
            ),
          );
          // }
        } else {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  RegistrationPage(loginResponse: loginResponse),
            ),
          );
        }
      },
    );
    return Scaffold(
      // backgroundColor: kgreen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          kheight20,
          const LogoWidget(
            mainAxisAlignment: MainAxisAlignment.center,
            widthFactor: 1.5,
          ),
          Image.asset(
            'assets/images/dubai.png',
            width: double.infinity,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}
