import 'dart:developer';

import 'package:app_version_update/app_version_update.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/constant/colors/colors.dart';
import 'package:salesapp/provider/franchise_dashboard_provider/franchise_dashboard_provider.dart';
import 'package:salesapp/provider/franchise_member_provider/franchise_member_provider.dart';
import 'package:salesapp/provider/franchise_onboard_sotre_provider/franchise_onboard_store_provider.dart';
import '../../common_widget/custom_poppins.dart';
import '../../constant/responsive.dart';
import '../../provider/profile_provider/profile_provider.dart';
import '../../provider/theme_provider.dart';
import '../../utils/language/local_storage.dart';
import '../notification_page/notification_page.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  void initState() {
    super.initState();

    _verifyVersion();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileProvider>(context, listen: false)
          .fetchProfileDetails();
      Provider.of<FranchiseOnboardStoreProvider>(context, listen: false)
          .fetchFranchiseOnboardStore(context, 1);
      Provider.of<FranchiseDashboardProvider>(context, listen: false)
          .fetchFranchiseDasboard();
      Provider.of<FranchiseMemberProvider>(context, listen: false)
          .fetchAllFranchiseMember();
    });
  }

  void _verifyVersion() async {
    try {
      await AppVersionUpdate.checkForUpdates(appleId: '6463752059')
          .then((data) async {
        if (data.canUpdate!) {
          await AppVersionUpdate.showAlertUpdate(
            appVersionResult: data,
            mandatory: true,
            context: context,
            backgroundColor: Colors.grey[200],
            title: 'New Update Available',
            content:
                'Please update to the latest version to enjoy all the updated features',
            updateButtonText: 'UPDATE',
            titleTextStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
            ),
            contentTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          );
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          themeChange.theme == ThemeMode.light ? Colors.grey.shade200 : kblack,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.black.withOpacity(0.4)),
        iconTheme: const IconThemeData(color: kwhite),
        title: Text(
          tr(context).partner,
          style: const TextStyle(
            color: kwhite,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.notifications_none,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Consumer<FranchiseDashboardProvider>(
              builder: (context, model, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr(context).earnings,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: themeChange.theme == ThemeMode.light
                        ? Colors.orange
                        : const Color.fromARGB(255, 98, 97, 97),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.account_balance_wallet_outlined,
                              size: 55,
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tr(context).balance,
                                  style: const TextStyle(
                                    // color: kwhite,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                const Text(
                                  "\$ 30.00",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    // color: kwhite,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  tr(context).today,
                                  style: const TextStyle(
                                    // color: kwhite,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "\$ 0.00",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    // color: kwhite,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 40,
                              width: 1,
                              color: kwhite,
                            ),
                            Column(
                              children: [
                                Text(
                                  tr(context).this_week,
                                  style: const TextStyle(
                                    // color: kwhite,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "\$ 0.00",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    // color: kwhite,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 40,
                              width: 1,
                              color: kwhite,
                            ),
                            Column(
                              children: [
                                Text(
                                  tr(context).this_month,
                                  style: const TextStyle(
                                    // color: kwhite,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "\$ 0.00",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    // color: kwhite,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomPoppinsText(
                  text: tr(context).orders,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: ResponsiveRatio().height(context, 0.2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: themeChange.theme == ThemeMode.light
                              ? const Color(0xff72e3bb)
                              : const Color.fromARGB(255, 98, 97, 97),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomPoppinsText(
                              text:
                                  "${model.franchiseDashboardDetails?.todayStores ?? 0}",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: kwhite,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomPoppinsText(
                              text:
                                  "${tr(context).today}\n${tr(context).store}",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: kwhite,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: ResponsiveRatio().height(context, 0.2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: themeChange.theme == ThemeMode.light
                              ? const Color(0xffde3958)
                              : const Color.fromARGB(255, 98, 97, 97),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomPoppinsText(
                              text:
                                  "${model.franchiseDashboardDetails?.weeklyStores ?? 0}",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: kwhite,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomPoppinsText(
                              text: tr(context).this_week,
                              textAlign: TextAlign.center,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: kwhite,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: ResponsiveRatio().height(context, 0.17),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: themeChange.theme == ThemeMode.light
                        ? Colors.orange
                        : const Color.fromARGB(255, 98, 97, 97),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomPoppinsText(
                        text:
                            "${model.franchiseDashboardDetails?.totalOnboardStores ?? 0}",
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: kwhite,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomPoppinsText(
                        text:
                            "${tr(context).total} ${tr(context).on_board} ${tr(context).stores}",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: kwhite,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: ResponsiveRatio().height(context, 0.17),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: themeChange.theme == ThemeMode.light
                              ? const Color(0xffde3958)
                              : const Color.fromARGB(255, 98, 97, 97),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomPoppinsText(
                              text:
                                  "${model.franchiseDashboardDetails?.totalTeams ?? 0}",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: kwhite,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomPoppinsText(
                              text: "${tr(context).total} ${tr(context).team}",
                              textAlign: TextAlign.center,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: kwhite,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: ResponsiveRatio().height(context, 0.17),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: themeChange.theme == ThemeMode.light
                              ? const Color(0xff7dcc73)
                              : const Color.fromARGB(255, 98, 97, 97),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomPoppinsText(
                              text:
                                  "AED ${model.franchiseDashboardDetails?.totalEarning?.toStringAsFixed(2) ?? 0}",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: kwhite,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomPoppinsText(
                              text:
                                  "${tr(context).total} ${tr(context).earnings}",
                              textAlign: TextAlign.center,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: kwhite,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
