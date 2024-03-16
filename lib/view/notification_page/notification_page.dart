import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salesapp/constant/colors/colors.dart';

import '../../common_widget/custom_poppins.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.black.withOpacity(0.4)),
          iconTheme: const IconThemeData(color: kwhite),
          title: const CustomPoppinsText(
            text: "Notification",
            color: kwhite,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 30,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kwhite),
                              child: const ListTile(
                                title: CustomPoppinsText(
                                  text: "You received message",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                subtitle: Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: CustomPoppinsText(
                                    text: "there is offer for you",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        )
        // Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Image.asset("asset/image/notification.png",scale: 1,),
        //     const  SizedBox(height: 15,),

        //      const CustomPoppinsText(text: "Yet not notification received you",textAlign: TextAlign.center,fontSize: 17,),

        //     ],
        //   ),
        // ),
        );
  }
}
