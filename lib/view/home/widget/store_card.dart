import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/common_widget/custom_button.dart';
import 'package:salesapp/model/search_store_details/search_store_details.dart';
import 'package:salesapp/provider/dashboard_provider/dashboard_provider.dart';
import 'package:salesapp/utils/language/local_storage.dart';
import 'package:sizer/sizer.dart';

import '../../../config.dart';
import '../../../constant/colors/colors.dart';
import '../../../constant/size/size.dart';
import '../../../provider/theme_provider.dart';
import '../../../utils/utils.dart';

// ignore: must_be_immutable
class HomeMainCard extends StatelessWidget {
  SearchStoreDetails storeDetails;
  final int index;
  // late VerifyOTPPopupDialog verifyOTPPopupDialog;

  HomeMainCard({
    super.key,
    required this.storeDetails,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    // String currentDate = DateFormat('d/MM/yyyy')
    //     .format(DateTime.parse(storeDetails.createdAt!).toLocal());
    // String currentTime = DateFormat.jm()
    //     .format(DateTime.parse(storeDetails.createdAt!).toLocal());
    final bool isMobile = SizerUtil.deviceType == DeviceType.mobile;
    final themeData = Provider.of<ThemeProvider>(context);
    return Slidable(
      // endActionPane: ActionPane(
      //   motion: const ScrollMotion(),
      //   children: [
      //     SlidableAction(
      //       onPressed: (context) {
      //         // Provider.of<StoresProvider>(context, listen: false)
      //         //     .fetchStoreDetails(
      //         //   storeDetails.ID,
      //         // );

      //         // navigatorKey.currentState!.pushNamed(
      //         //   AddEditStore.routeName,
      //         //   arguments: {
      //         //     "isEditMode": true,
      //         //     "storeId": storeDetails.userId,
      //         //   },
      //         // );
      //       },
      //       backgroundColor: kgreen,
      //       foregroundColor: Colors.white,
      //       icon: Icons.edit,
      //       label: 'Edit',
      //     ),
      //   ],
      // ),
      child: Card(
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
                  onTap: () => imageView(context, storeDetails.storeName!,
                      Config.imageURL + storeDetails.storeProfilePic!),
                  child: Container(
                    margin: isMobile
                        ? const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 10,
                          )
                        : const EdgeInsets.all(10),
                    height: isMobile ? 130 : 130,
                    width: isMobile ? 130 : 130,
                    // height: 90,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: storeDetails.storeProfilePic != null
                          ? CachedNetworkImage(
                              // memCacheWidth: 45,
                              // memCacheHeight: 60,
                              // maxHeightDiskCache: 60,
                              // maxWidthDiskCache: 45,
                              imageUrl: Config.imageURL +
                                  storeDetails.storeProfilePic!,
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
                              errorWidget: (context, url, error) => SizedBox(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  storeDetails.storeName!.toUpperCase(),
                                  maxLines: isMobile ? 2 : 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: isMobile ? 12 : 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  storeDetails.storeCategory?.categoryName ??
                                      '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: isMobile ? 12 : 14,
                                    color: klightBlue,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),

                                // storeDetails.userId != null &&
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
                                  if (storeDetails.userId == null
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
                                      storeDetails.userId != null
                                          ? 'assets/images/verified.png'
                                          // : storeDetails.callVerification != true
                                          //     ? 'assets/images/otp-password.png'
                                          : 'assets/images/un-verified.png',
                                      fit: BoxFit.cover,
                                      height: 30,
                                    ),
                                    Text(
                                      storeDetails.userId != null
                                          ? '${tr(context).store} ${tr(context).verified}'
                                          : '${tr(context).store} ${tr(context).unverified}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        color: storeDetails.userId != null
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
                      // if(storeDetails.)
                      CustomButton(
                        width: 180,
                        onTap: () {
                          Provider.of<DashboardProvider>(context, listen: false)
                              .registerStoreAsWhitelabel(
                            storeDetails.ID,
                            (val) {
                              if (val != null) {
                                Utils.showToastMessage(
                                  context,
                                  val,
                                  position: StyledToastPosition.top,
                                );
                              } else {
                                Utils.showToastMessage(
                                  context,
                                  tr(context).something_went_wrong,
                                  isError: true,
                                  position: StyledToastPosition.top,
                                );
                              }
                            },
                          );
                        },
                        text: tr(context).apply_for_whitelabel,
                        height: 30,
                        textsize: 12,
                      )
                    ],
                  ),
                ),
                kwidth,
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget qrSection({
  //   required BuildContext context,
  //   required StoreDetails model,
  //   required int i,
  // }) {
  //   return GestureDetector(
  //     onTap: model.qrCodeID != null
  //         ? () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) => QrViewScreen(
  //                   qrCodeID: model.qrCodeID!,
  //                   storeName: model.storeName!,
  //                 ),
  //               ),
  //             );
  //           }
  //         : () {
  //             // Provider.of<StoresProvider>(context, listen: false)
  //             //     .setQrCodeIndex(i);
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) => const QrScannerScreen(),
  //               ),
  //             );
  //           },
  //     child: Container(
  //       margin: const EdgeInsets.only(bottom: 10),
  //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  //       decoration: BoxDecoration(
  //         color: model.qrCodeID != null ? kgreen : kblack,
  //         borderRadius: BorderRadius.circular(8),
  //         border: Border.all(color: Colors.grey.shade400),
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           const Icon(
  //             CupertinoIcons.qrcode,
  //             color: kwhite,
  //           ),
  //           const SizedBox(width: 8),
  //           Text(
  //             model.qrCodeID != null ? 'Allotted' : 'Allot',
  //             style: const TextStyle(fontSize: 12, color: kwhite),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget documentIconHome({
  //   storeId,
  //   required BuildContext context,
  // }) {
  //   return GestureDetector(
  //     onTap: () {
  //       // Provider.of<UploadDocsProvider>(context, listen: false)
  //       //     .fetchStoreDocs(storeDetails.ID);

  //       // Navigator.pushNamed(
  //       //   context,
  //       //   UploadDocumentScreen.routeName,
  //       //   // (route) => false,
  //       //   arguments: {
  //       //     "storeId": storeDetails.ID,
  //       //   },
  //       // );
  //     },
  //     child: Container(
  //       margin: const EdgeInsets.only(bottom: 10),
  //       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
  //       decoration: BoxDecoration(
  //         color: Colors.orange,
  //         borderRadius: BorderRadius.circular(8),
  //         border: Border.all(color: Colors.grey.shade400),
  //       ),
  //       child: const Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Icon(
  //             CupertinoIcons.doc_chart_fill,
  //             color: kwhite,
  //           ),
  //           SizedBox(width: 4),
  //           Text(
  //             'Documnet',
  //             style: TextStyle(fontSize: 12, color: kwhite),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget paymentSection(
  //   context, {
  //   required int index,
  //   required StoreDetails model,
  // }) {
  //   return GestureDetector(
  //     onTap: () async {
  //       if (model.userId == null || model.userId!.isEmpty) {
  //         Utils.showToastMessage(
  //           context,
  //           'Store Not Verifeid',
  //           isError: true,
  //           position: StyledToastPosition.top,
  //         );
  //       } else {
  //         if (model.isPlanUpgraded == false) {
  //           Provider.of<SellerPackageProvider>(context, listen: false)
  //               .setSellerid(model.ID);
  //           Provider.of<SellerPackageProvider>(context, listen: false)
  //               .setUserid(model.userId);
  //           navigatorKey.currentState!.pushNamed(
  //               UpgradePackagesScreen.routeName,
  //               arguments: {'store': model});
  //         } else {
  //           Utils.showToastMessage(
  //             context,
  //             'Already Upgraded',
  //             position: StyledToastPosition.top,
  //           );
  //         }
  //       }
  //     },
  //     child: Container(
  //       margin: const EdgeInsets.only(bottom: 10),
  //       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
  //       decoration: BoxDecoration(
  //         //Todo: //! Paymnet done background is green
  //         color: model.isPlanUpgraded != null && model.isPlanUpgraded!
  //             ? kgreen
  //             : klightBlue,
  //         borderRadius: BorderRadius.circular(8),
  //         border: Border.all(color: Colors.grey.shade400),
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           const Icon(
  //             CupertinoIcons.money_dollar_circle_fill,
  //             color: kwhite,
  //           ),
  //           const SizedBox(width: 4),
  //           //todo: //! if paymnet done text will be upgraded
  //           Text(
  //             model.isPlanUpgraded != null && model.isPlanUpgraded!
  //                 ? 'upgraded'
  //                 : 'upgrade',
  //             style: const TextStyle(
  //               fontSize: 12,
  //               color: kwhite,
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

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
