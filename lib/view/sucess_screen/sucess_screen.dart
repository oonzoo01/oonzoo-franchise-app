import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:salesapp/constant/colors/colors.dart';
import 'package:salesapp/constant/size/size.dart';
import 'package:salesapp/login_page.dart';

import '../../api/shared_service.dart';
import '../home/dashboard.dart';
import '../partner_bottom_nav/partner_bottom_nav.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () async {
        final isLogin = await SharedService.isLoggedIn();
        final loginResponse = await SharedService.loginDetails();
        if (isLogin) {
          if (loginResponse?.partnerType == 'freelancer') {
            Navigator.pushAndRemoveUntil(
              // ignore: use_build_context_synchronously
              context,
              MaterialPageRoute(
                builder: (context) => const DashboardPage(),
              ),
              (route) => false,
            );
          } else {
            Navigator.pushAndRemoveUntil(
              // ignore: use_build_context_synchronously
              context,
              MaterialPageRoute(
                builder: (context) => const PartnerBottomNav(),
              ),
              (route) => false,
            );
          }
        } else {
          Navigator.pushAndRemoveUntil(
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute<SignInPage>(
              builder: (BuildContext context) => const SignInPage(),
            ),
            (route) => false,
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/succes.json', width: 100),
            kheight15,
            const Text(
              'Registration is Successfully',
              style: TextStyle(
                color: kblack,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
