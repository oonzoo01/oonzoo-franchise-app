import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/provider/theme_provider.dart';
import 'package:sizer/sizer.dart';

import '../../../common_widget/custom_button.dart';
import '../../../config.dart';
import '../../../constant/colors/colors.dart';
import '../../../constant/size/size.dart';
import '../../../provider/dashboard_provider/dashboard_provider.dart';
import '../../../utils/language/local_storage.dart';
import '../../../utils/utils.dart';

class OnboardStoreListWidget extends StatelessWidget {
  const OnboardStoreListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = SizerUtil.deviceType == DeviceType.mobile;
    final themeData = Provider.of<ThemeProvider>(context);
    return Consumer<DashboardProvider>(builder: (context, model, _) {
      if (model.isLoading ?? false) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      } else if ((model.onBoardStoreList.isEmpty)) {
        return SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.7,
          child: Center(
            child: Lottie.asset(
              'assets/images/empty.json',
            ),
          ),
        );
      } else {
        return Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: model.onBoardStoreList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                final data = model.onBoardStoreList[index];

                return Card(
                  elevation: 1,
                  color: themeData.theme == ThemeMode.light
                      ? kwhite
                      : kblack.withOpacity(0.1),
                  margin: isMobile
                      ? const EdgeInsets.only(left: 8, right: 8, bottom: 5)
                      : const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => imageView(
                                context,
                                data.storeName ?? '',
                                Config.imageURL + (data.storeProfilePic ?? '')),
                            child: Container(
                              margin: isMobile
                                  ? const EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 10,
                                    )
                                  : const EdgeInsets.all(10),
                              height: isMobile ? 100 : 100,
                              width: isMobile ? 100 : 100,
                              // height: 90,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: data.storeProfilePic != null
                                    ? CachedNetworkImage(
                                        // memCacheWidth: 45,
                                        // memCacheHeight: 60,
                                        // maxHeightDiskCache: 60,
                                        // maxWidthDiskCache: 45,
                                        imageUrl: Config.imageURL +
                                            (data.storeProfilePic ?? ''),
                                        height: 100.0,
                                        width: 100,
                                        fit: BoxFit.fill,
                                        placeholder: (context, url) =>
                                            Utils.photoShimmer(100, 100),
                                        // const SizedBox(
                                        //   height: 100.0,
                                        //   width: 100.0,
                                        //   child: Center(
                                        //     child: CircularProgressIndicator(),
                                        //   ),
                                        // ),
                                        errorWidget: (context, url, error) =>
                                            SizedBox(
                                          height: 100,
                                          child: Image.asset(
                                            "assets/images/menu_logo.png",
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      )
                                    : SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Image.asset(
                                          "assets/images/menu_logo.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          kwidth5,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "${data.storeName?.toUpperCase()}",
                                            maxLines: isMobile ? 2 : 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              fontSize: isMobile ? 12 : 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(height: 3),
                                          Text(
                                            data.storeCategory ?? '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              fontSize: isMobile ? 12 : 14,
                                              color: klightBlue,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          kheight5,
                                          Text(
                                            "+971 ${data.storeContactDetails}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              fontSize: isMobile ? 12 : 14,
                                              // color: kblack,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),

                                          // data.userId != null &&
                                          //         storeDetails.isPlanUpgraded != null
                                          //     ? GestureDetector(
                                          //         child: Row(
                                          //           children: <Widget>[
                                          //             const Icon(
                                          //               Icons.add,
                                          //               color: lightOrange,
                                          //               size: 20,
                                          //             ),
                                          //             Text(
                                          //               'Add Product',
                                          //               style: GoogleFonts.poppins(
                                          //                 fontSize: 14,
                                          //                 color: lightOrange,
                                          //                 fontWeight: FontWeight.w400,
                                          //               ),
                                          //             ),
                                          //           ],
                                          //         ),
                                          //         onTap: () => {
                                          //           Navigator.pushNamed(
                                          //             context,
                                          //             ProductCataloguePage.routeName,
                                          //             // (route) => false,
                                          //             arguments: {
                                          //               "isEditMode": true,
                                          //               "storeId": storeDetails.ID,
                                          //             },
                                          //           )
                                          //         },
                                          //       )
                                          //     : const SizedBox(),
                                          kheight,
                                          // Text.rich(
                                          //   TextSpan(
                                          //     children: [
                                          //       TextSpan(
                                          //         text: currentTime,
                                          //         style: GoogleFonts.poppins(
                                          //           fontWeight: FontWeight.w600,
                                          //           color: lightBlue,
                                          //         ),
                                          //       ),
                                          //       WidgetSpan(
                                          //         child: SizedBox(
                                          //           width: isMobile ? 5 : 10,
                                          //         ),
                                          //       ),
                                          //       TextSpan(
                                          //         text: currentDate,
                                          //         style: GoogleFonts.poppins(
                                          //           fontWeight: FontWeight.w600,
                                          //           color: brown,
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                          // kheight,
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (data.userId == null
                                                // &&
                                                //     storeDetails.callVerification != true
                                                ) {
                                              // Provider.of<OtpProvider>(context,
                                              //         listen: false)
                                              //     .setInitialValue(120);
                                              // verifyOTPPopupDialog =
                                              //     VerifyOTPPopupDialog();
                                              // verifyOTPPopupDialog.openDialog(
                                              //   navigatorKey.currentContext,
                                              //   storeDetails.storeName,
                                              //   storeDetails.storeContactDetails,
                                              //   Provider.of<OtpProvider>(context,
                                              //           listen: false)
                                              //       .isOtp,
                                              // );
                                              //todo:
                                              //1. SEND OTP
                                              //2. Upon successfully Verified Create User in Database
                                              //3. Map UserID with that Store
                                              //4. Bingo !!

                                              // var loaderModel = Provider.of<LoaderProvider>(context,
                                              //     listen: false);

                                              // loaderModel.setLoadingStatus(true);
                                              // var _context = context;
                                              // Provider.of<StoresProvider>(context, listen: false)
                                              //     .sendOTP(
                                              //   storeDetails.storeName,
                                              //   storeDetails.storeContactDetails,
                                              //   (val) {
                                              //     loaderModel.setLoadingStatus(false);

                                              //     if (val) {
                                              //       verifyOTPPopupDialog = VerifyOTPPopupDialog();
                                              //       verifyOTPPopupDialog.openDialog(
                                              //         navigatorKey.currentContext,
                                              //         storeDetails.storeName,
                                              //         storeDetails.storeContactDetails,
                                              //       );
                                              //     }
                                              //   },
                                              // );
                                            }
                                          },
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                data.userId != null
                                                    ? 'assets/images/verified.png'
                                                    // : storeDetails.callVerification != true
                                                    //     ? 'assets/images/otp-password.png'
                                                    : 'assets/images/un-verified.png',
                                                fit: BoxFit.cover,
                                                height: 30,
                                              ),
                                              Text(
                                                data.userId != null
                                                    ? '${tr(context).store} ${tr(context).verified}'
                                                    : '${tr(context).store} ${tr(context).unverified}',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 11,
                                                  color: data.userId != null
                                                      ? kgreen
                                                      : kred,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        divThick5,
                                        kheight,
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    if (data.onboardAuditProcess == null ||
                                        data.onboardAuditProcess == "4")
                                      Expanded(
                                        child: CustomButton(
                                          onTap: () {
                                            model.addAuditRequest(
                                              data.ID,
                                              (val) {
                                                if (val != null) {
                                                  Provider.of<DashboardProvider>(
                                                          context,
                                                          listen: false)
                                                      .fetchFreelancerOnboardStores(
                                                    context,
                                                    1,
                                                  );
                                                  Utils.showToastMessage(
                                                    context,
                                                    val,
                                                    position:
                                                        StyledToastPosition.top,
                                                  );
                                                } else {
                                                  Utils.showToastMessage(
                                                    context,
                                                    tr(context)
                                                        .something_went_wrong,
                                                    isError: true,
                                                    position:
                                                        StyledToastPosition.top,
                                                  );
                                                }
                                              },
                                            );
                                          },
                                          text: "Ready for audit",
                                          height: 30,
                                          textsize: 10,
                                        ),
                                      ),
                                    const SizedBox(width: 6),
                                    if (!(data.isWhiteLabelApp ?? false))
                                      Expanded(
                                        child: CustomButton(
                                          onTap: () {
                                            Provider.of<DashboardProvider>(
                                                    context,
                                                    listen: false)
                                                .registerStoreAsWhitelabel(
                                              data.ID,
                                              (val) {
                                                if (val != null) {
                                                  Utils.showToastMessage(
                                                    context,
                                                    val,
                                                    position:
                                                        StyledToastPosition.top,
                                                  );
                                                } else {
                                                  Utils.showToastMessage(
                                                    context,
                                                    tr(context)
                                                        .something_went_wrong,
                                                    isError: true,
                                                    position:
                                                        StyledToastPosition.top,
                                                  );
                                                }
                                              },
                                            );
                                          },
                                          text:
                                              tr(context).apply_for_whitelabel,
                                          height: 30,
                                          textsize: 10,
                                        ),
                                      ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          kwidth,
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     const SizedBox(width: 8),
                      //     Expanded(
                      //       child: qrSection(
                      //         context: context,
                      //         model: storeDetails,
                      //         i: index,
                      //       ),
                      //     ),
                      //     const SizedBox(width: 8),
                      //     Expanded(
                      //       child: documentIconHome(
                      //         storeId: storeDetails.ID,
                      //         context: context,
                      //       ),
                      //     ),
                      //     const SizedBox(width: 8),
                      //     Expanded(
                      //       child: paymentSection(context,
                      //           model: storeDetails, index: index),
                      //     ),
                      //     const SizedBox(width: 8),
                      //   ],
                      // ),
                      // if (Provider.of<StoresProvider>(context).qrCodeID != null &&
                      //     Provider.of<StoresProvider>(context).qrCodeIndex == index)
                      //   Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Expanded(
                      //           flex: 4,
                      //           child: TextFormField(
                      //             initialValue: Provider.of<StoresProvider>(context,
                      //                     listen: true)
                      //                 .qrCodeID,
                      //             readOnly: true,
                      //             decoration: const InputDecoration(
                      //               contentPadding:
                      //                   EdgeInsets.symmetric(horizontal: 12),
                      //               border: OutlineInputBorder(),
                      //               labelText: 'Qr Data',
                      //             ),
                      //           ),
                      //         ),
                      //         GestureDetector(
                      //           onTap: () {
                      //             final value = Provider.of<StoresProvider>(context,
                      //                     listen: false)
                      //                 .qrCodeID;
                      //             log(value.toString());
                      //             print(value!.split('?id=').last);

                      //             print(storeDetails.ID);
                      //             if (value.contains('?id=')) {
                      //               if (value.split('?id=').last.isNotEmpty) {
                      //                 var loaderModel = Provider.of<LoaderProvider>(
                      //                     context,
                      //                     listen: false);

                      //                 loaderModel.setIsLoading(true);

                      //                 // Provider.of<StoresProvider>(context, listen: false)
                      //                 //     .allotStoreQRCode(
                      //                 //   value.split('?id=').last,
                      //                 //   storeDetails.ID,
                      //                 //   (response, val) {
                      //                 //     loaderModel.setLoadingStatus(false);

                      //                 //     if (val) {
                      //                 //       Utils.showToastMessage(
                      //                 //         context,
                      //                 //         "Successfully Alloted QR Code",
                      //                 //         isError: false,
                      //                 //         position: StyledToastPosition.top,
                      //                 //       );
                      //                 //     } else {
                      //                 //       Utils.showToastMessage(
                      //                 //         context,
                      //                 //         response,
                      //                 //         isError: true,
                      //                 //         position: StyledToastPosition.top,
                      //                 //       );
                      //                 //       Provider.of<StoresProvider>(context,
                      //                 //               listen: false)
                      //                 //           .clearQrId();
                      //                 //     }
                      //                 //   },
                      //                 // );
                      //               }
                      //             } else {
                      //               Utils.showToastMessage(
                      //                 context,
                      //                 'Invalid QrCode',
                      //                 isError: true,
                      //                 position: StyledToastPosition.top,
                      //               );
                      //             }
                      //           },
                      //           child: Container(
                      //             margin: const EdgeInsets.only(left: 6),
                      //             padding: const EdgeInsets.symmetric(
                      //                 horizontal: 8, vertical: 4),
                      //             decoration: BoxDecoration(
                      //                 color: lightOrange,
                      //                 border: Border.all(color: Colors.grey.shade400),
                      //                 borderRadius: BorderRadius.circular(6)),
                      //             child: const Column(
                      //               children: [
                      //                 Icon(Icons.add, color: kwhite),
                      //                 Text(
                      //                   'Allotted',
                      //                   style: TextStyle(
                      //                     color: kwhite,
                      //                     fontWeight: FontWeight.w600,
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      }
    });
  }

  void imageView(
    BuildContext context,
    String storeName,
    String storeImage,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  storeName,
                  // maxLines: isMobile ? 2 : 1,
                  // overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: kwhite,
                  ),
                ),
              ),
              Dialog(
                backgroundColor: Colors.transparent,
                child: InteractiveViewer(
                  child: CachedNetworkImage(
                    imageUrl: storeImage,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => const SizedBox(
                      height: 60.0,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.close,
                    size: 29,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
