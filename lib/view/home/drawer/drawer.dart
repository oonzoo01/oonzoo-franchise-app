import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/common_widget/custom_poppins.dart';
import 'package:salesapp/constant/colors/colors.dart';
import 'package:salesapp/provider/profile_provider/profile_provider.dart';
import 'package:salesapp/utils/utils.dart';
import 'package:salesapp/view/insights/insights.dart';

import '../../../api/shared_service.dart';
import '../../../constant/size/size.dart';
import '../../../constant/text/text.dart';
import '../../../provider/theme_provider.dart';
import '../../../utils/language/local_storage.dart';
import '../../customersupport/customer_support.dart';
import '../../delete_account/delete_account.dart';
import '../../settings/settings.dart';
import '../../wallet_screen/wallet_screen.dart';
import '../dashboard.dart';
import 'widget/drawer_list.dart';
import 'widget/partner_info.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SDNavigationDrawer extends StatelessWidget {
  const SDNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    return Drawer(
      child: Stack(
        children: <Widget>[
          Column(
            // physics: const NeverScrollableScrollPhysics(),
            // padding: EdgeInsets.zero,
            children: <Widget>[
              const PartnerInformationWidget(),
              kheight5,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(lightOrange),
                      ),
                      onPressed: () {
                        Provider.of<ProfileProvider>(context, listen: false)
                            .setClockInValue();
                        // if (Provider.of<ProfileProvider>(context).isClockIn) {
                        //   Provider.of<ProfileProvider>(context, listen: false)
                        //       .startTimer();
                        // }
                      },
                      child: CustomPoppinsText(
                        text: Provider.of<ProfileProvider>(context).isClockIn
                            ? tr(context).clock_out
                            : tr(context).clock_in,
                        color: kwhite,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          CustomPoppinsText(
                            text: Utils.formatTimeOnly(
                                Provider.of<ProfileProvider>(context).seconds),
                            color: themeChange.theme == ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomPoppinsText(
                            text:
                                Provider.of<ProfileProvider>(context).isClockIn
                                    ? tr(context).you_are_working
                                    : tr(context).you_are_on_break,
                          )
                          // RichText(
                          //   text: TextSpan(
                          // text: Provider.of<ProfileProvider>(context)
                          //         .isClockIn
                          //     ? 'You are currently '
                          //     : 'You are on a ',
                          //     style: GoogleFonts.poppins(
                          //         color: Provider.of<ProfileProvider>(context)
                          //                 .isClockIn
                          //             ? Colors.green
                          //             : Colors.red),
                          //     children: <TextSpan>[
                          //       TextSpan(
                          //         text: Provider.of<ProfileProvider>(context)
                          //                 .isClockIn
                          //             ? 'Working'
                          //             : 'break',
                          //         style: const TextStyle(
                          //             fontWeight: FontWeight.bold),
                          //       ),
                          //       if (!Provider.of<ProfileProvider>(context)
                          //           .isClockIn)
                          //         const TextSpan(text: ' now'),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              DrawerListWidget(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<DashboardPage>(
                      builder: (BuildContext context) => const DashboardPage(),
                    ),
                  );
                },
                icon: Icons.home,
                text: tr(context).home,
              ),
              DrawerListWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<InsightsScreen>(
                      builder: (BuildContext context) => const InsightsScreen(),
                    ),
                  );
                },
                icon: Icons.business,
                text: tr(context).business_insight,
              ),
              DrawerListWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<WalletScreen>(
                      builder: (BuildContext context) => const WalletScreen(),
                    ),
                  );
                },
                icon: Icons.wallet,
                text: tr(context).wallet,
              ),
              DrawerListWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<SettingsScreen>(
                      builder: (BuildContext context) => const SettingsScreen(),
                    ),
                  );
                },
                icon: Icons.settings,
                text: tr(context).settings,
              ),
              // DrawerListWidget(
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute<TermsCondtionScreen>(
              //         builder: (BuildContext context) =>
              //             const TermsCondtionScreen(),
              //       ),
              //     );
              //   },
              //   icon: Icons.list_alt,
              //   text: 'Terms & Conditions',
              // ),
              DrawerListWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<CustomerSupportScreen>(
                      builder: (BuildContext context) =>
                          CustomerSupportScreen(),
                    ),
                  );
                },
                icon: Icons.contact_support,
                text: tr(context).support,
              ),
              DrawerListWidget(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute<DeleteAccountScreen>(
                      builder: (BuildContext context) =>
                          const DeleteAccountScreen(),
                    ),
                  );
                },
                icon: Icons.delete,
                text: tr(context).delete_account,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: DrawerListWidget(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          tr(context).confirmation,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        content: Text(
                          tr(context).do_you_want_logout,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(lightOrange),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              tr(context).no,
                              style: const TextStyle(color: kwhite),
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(lightOrange),
                            ),
                            onPressed: () {
                              SharedService.logout();
                              Navigator.pop(context);
                              if (Provider.of<ProfileProvider>(context,
                                      listen: false)
                                  .isClockIn) {
                                Provider.of<ProfileProvider>(context,
                                        listen: false)
                                    .setClockInValue();
                              }
                            },
                            child: Text(
                              tr(context).yes,
                              style: const TextStyle(color: kwhite),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: Icons.logout,
                  text: tr(context).logout,
                ),
              ),
            ],
          ),
          kheight20,
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: 50,
                child: Container(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Text(
                        'Developed By',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Image.asset(
                        'assets/images/verified.png',
                        height: 35,
                        fit: BoxFit.cover,
                      ),
                      const Text(
                        '$compnayName Team',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              getAppVersion(),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getAppVersion() {
    return FutureBuilder(
      future: PackageInfo.fromPlatform(),
      builder: (
        BuildContext context,
        AsyncSnapshot<PackageInfo?> model,
      ) {
        if (model.hasData) {
          return Center(
            child: Text("V${model.data!.version.toString()}+1"),
          );
        }

        return Container(
          padding: const EdgeInsets.all(10),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

// DrawerListWidget(
//   onTap: () {
//     Navigator.pop(context);
//     Navigator.push(
//       context,
//       MaterialPageRoute<DashboardPage>(
//         builder: (BuildContext context) => const SearchStores(),
//       ),
//     );
//   },
//   icon: Icons.search,
//   text: 'Search Stores',
// ),
// DrawerListWidget(
//   onTap: () {
//     Navigator.pop(context);
//     Navigator.push(
//       context,
//       MaterialPageRoute<OonzooLicencePage>(
//         builder: (BuildContext context) =>
//             const OonzooLicencePage(),
//       ),
//     );
//   },
//   icon: Icons.badge,
//   text: 'Oonzoo Licence',
// ),
// DrawerListWidget(
//   onTap: () {
//     Navigator.pop(context);
//     Navigator.push(
//       context,
//       MaterialPageRoute<UserDetails>(
//         builder: (BuildContext context) => const UserDetails(),
//       ),
//     );
//   },
//   icon: Icons.contacts,
//   text: 'Company Id',
// ),
// DrawerListWidget(
//   onTap: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute<DashboardPage>(
//         builder: (BuildContext context) => const SearchStores(),
//       ),
//     );
//   },
//   icon: Icons.search,
//   text: 'Upgraded History',
// ),
// DrawerListWidget(
//   onTap: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute<InsightsScreen>(
//         builder: (BuildContext context) => const InsightsScreen(),
//       ),
//     );
//   },
//   icon: Icons.bar_chart_outlined,
//   text: 'Insight',
// ),
// DrawerListWidget(
//   onTap: () {
//     Navigator.pop(context);
//     Navigator.push(
//       context,
//       MaterialPageRoute<UpgradedHistory>(
//         builder: (BuildContext context) =>
//             const UpgradedHistory(),
//       ),
//     );
//   },
//   icon: Icons.wallet,
//   text: 'Upgraded History',
// ),
