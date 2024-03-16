import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'widget/intro_text.dart';
import 'widget/number_bottomber.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const IntroText(),
                Lottie.asset(
                  'assets/images/sales.json',
                ),
              ],
            ),
          ),
          CustomNumberbottomBar()
        ],
      ),
    );
  }
}
