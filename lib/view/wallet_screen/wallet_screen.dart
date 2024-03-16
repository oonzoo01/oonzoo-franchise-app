import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/common_widget/custom_poppins.dart';
import 'package:salesapp/constant/responsive.dart';
import 'package:salesapp/constant/size/size.dart';
import 'package:salesapp/provider/wallet_provider/wallet_provider.dart';
import 'package:salesapp/utils/utils.dart';

import '../../constant/colors/colors.dart';
import '../../provider/theme_provider.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<WalletProvider>(context, listen: false)
          .fetchWalletTransactionHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    // final String currentDate = DateFormat('d MMM yyyy,').add_jm().format(
    //       DateTime.now(),
    //     );
    final themeChange = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeChange.theme == ThemeMode.light
          ? Colors.white
          : const Color.fromARGB(95, 74, 73, 73),
      // drawer: const NavigationDrawer(),
      appBar: AppBar(
        elevation: 0.5,
        title: const Text(
          'Sales Transactions',
          style: TextStyle(),
        ),
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          Provider.of<WalletProvider>(context, listen: false)
              .fetchWalletTransactionHistory();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<WalletProvider>(builder: (context, model, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Stack(
                //   children: <Widget>[
                //     Container(
                //       width: double.infinity,
                //       height: 120,
                //       padding: const EdgeInsets.symmetric(
                //         horizontal: 15,
                //         vertical: 15,
                //       ),
                //       child: Row(
                //         children: [
                //           Expanded(
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: <Widget>[
                //                 Text(
                //                   'AVAILABLE BALANCE',
                //                   style: GoogleFonts.poppins(
                //                     // color: kblack.withOpacity(0.5),
                //                     fontSize: 16,
                //                   ),
                //                 ),
                //                 Text(
                //                   'AED ${model.walletDetails?.walletBalance?.toStringAsFixed(2)}',
                //                   style: GoogleFonts.poppins(
                //                     // color: kblack,
                //                     fontWeight: FontWeight.bold,
                //                     fontSize: 20,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //           // Container(
                //           //   padding: const EdgeInsets.all(10),
                //           //   decoration: BoxDecoration(
                //           //       color: lightOrange,
                //           //       borderRadius: BorderRadius.circular(30)),
                //           //   child: Text(
                //           //     'Send to bank',
                //           //     style: GoogleFonts.poppins(
                //           //       color: kwhite,
                //           //       fontWeight: FontWeight.w500,
                //           //       fontSize: 14,
                //           //     ),
                //           //   ),
                //           // ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 5),
                //   child: Text(
                //     'Recent',
                //     style: GoogleFonts.poppins(
                //       // color: kblack.withOpacity(0.7),
                //       fontWeight: FontWeight.w600,
                //       fontSize: 16,
                //     ),
                //   ),
                // ),
                // const Divider(),
                // kheight,
                if (model.walletDetails?.data?.isNotEmpty ??
                    false || model.walletDetails?.data != null)
                  Expanded(
                    child: ListView.separated(
                      itemCount: model.walletDetails?.data?.length ?? 0,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                      itemBuilder: (BuildContext context, int index) {
                        final data = model.walletDetails?.data?[index];
                        final auditStatus = [
                          {'1': 'Audit Requested'},
                          {'2': 'In Review'},
                          {'3': 'Approved'},
                          {'4': 'Reject'},
                        ];
                        if (model.walletDetails?.data?.isEmpty ?? false) {
                          return Center(
                            child: Column(
                              children: [
                                CustomPoppinsText(
                                  text: 'No History Data',
                                  color: themeChange.theme == ThemeMode.light
                                      ? Colors.black
                                      : kwhite,
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      data?.storeName ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        // color: kblack,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      '${data?.salesType ?? ''} | ${Utils.formatDateOnly(data?.transactionDate ?? '')}',
                                      style: GoogleFonts.poppins(
                                        // color: kblack.withOpacity(0.6),
                                        fontSize: 10,
                                      ),
                                    ),
                                    kheight5,
                                    Text(
                                      data?.referenceNo ?? '',
                                      style: GoogleFonts.poppins(
                                        // color: kblack,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              kwidth,
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'AED ${data?.amount?.toStringAsFixed(2)}',
                                      style: GoogleFonts.poppins(
                                        // color: kblack,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          auditStatus
                                              .firstWhere(
                                                (statusMap) =>
                                                    statusMap.containsKey(
                                                        data?.auditProcess ??
                                                            '1'),
                                              )
                                              .values
                                              .first,
                                          style: GoogleFonts.poppins(
                                            color: themeChange.theme ==
                                                    ThemeMode.light
                                                ? data?.auditProcess == "2"
                                                    ? Colors.orange
                                                    : data?.auditProcess == "3"
                                                        ? Colors.green
                                                        : data?.auditProcess ==
                                                                "4"
                                                            ? Colors.red
                                                            : Colors.black
                                                : data?.auditProcess == "2"
                                                    ? Colors.orange
                                                    : data?.auditProcess == "3"
                                                        ? Colors.green
                                                        : data?.auditProcess ==
                                                                "4"
                                                            ? Colors.red
                                                            : Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        if (data?.auditProcess == "4")
                                          const SizedBox(width: 5),
                                        if (data?.auditProcess == "4")
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    content: CustomPoppinsText(
                                                      text:
                                                          data?.auditRemarks ??
                                                              '',
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child:
                                                            const CustomPoppinsText(
                                                          text: 'Ok',
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: const Icon(
                                              Icons.error_outline,
                                              color: Colors.blue,
                                              size: 15,
                                            ),
                                          )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: <Widget>[
                              //     Text(
                              //       '\$${totalEarnings[index].toStringAsFixed(2)}',
                              //       style: GoogleFonts.poppins(
                              //         // color: kblack,
                              //         fontWeight: FontWeight.w600,
                              //         fontSize: 14,
                              //       ),
                              //     ),
                              //     Text(
                              //       'Earnings',
                              //       style: GoogleFonts.poppins(
                              //         // color: kblack.withOpacity(0.6),
                              //         fontSize: 10,
                              //       ),
                              //     )
                              //   ],
                              // ),
                            ],
                          );
                        }
                      },
                    ),
                  )
                else
                  SizedBox(
                    height: ResponsiveRatio().height(context, 0.65),
                    child: Center(
                      child: CustomPoppinsText(
                        text: 'No History Data',
                        color: themeChange.theme == ThemeMode.light
                            ? Colors.black
                            : kwhite,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

// List<String> activites = <String>[
//   'vegitable & Fuits',
//   'Food & Meals',
//   'Sent to Bank',
//   'Pahrama Medicines',
//   'Custom Courier',
//   'vegitable & Fuits',
//   'vegitable & Fuits',
//   'Food & Meals',
//   'Sent to Bank',
//   'Pahrama Medicines',
//   'Custom Courier',
//   'vegitable & Fuits',
//   'vegitable & Fuits',
//   'Food & Meals',
//   'Sent to Bank',
//   'Pahrama Medicines',
//   'Custom Courier',
//   'vegitable & Fuits',
// ];
// List<double> totalPrice = <double>[
//   80.00,
//   110.00,
//   0.00,
//   80.00,
//   110.00,
//   0.00,
//   80.00,
//   110.00,
//   0.00,
//   80.00,
//   110.00,
//   0.00,
//   80.00,
//   110.00,
//   0.00,
//   80.00,
//   110.00,
//   0.00,
// ];
// List<double> totalEarnings = <double>[
//   5.20,
//   5.20,
//   -100.00,
//   6.50,
//   68.50,
//   5.20,
//   5.20,
//   5.20,
//   -100.00,
//   6.50,
//   68.50,
//   5.20,
//   5.20,
//   5.20,
//   -100.00,
//   6.50,
//   68.50,
//   5.20
// ];
