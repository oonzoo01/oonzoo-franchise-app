import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/model/on_oboard_store_model/on_oboard_store_model.dart';
import 'package:sizer/sizer.dart';
import '../../../config.dart';
import '../../../constant/colors/colors.dart';
import '../../../constant/size/size.dart';
import '../../../provider/theme_provider.dart';
import '../../../utils/language/local_storage.dart';
import '../../../utils/utils.dart';

class StoreWidget extends StatelessWidget {
  const StoreWidget({
    super.key,
    required this.storeDetails,
  });
  final OnBoardStoreListModel storeDetails;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = SizerUtil.deviceType == DeviceType.mobile;
    final themeChange = Provider.of<ThemeProvider>(context);
    return Card(
      elevation: 1,
      color: themeChange.theme == ThemeMode.light
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
                onTap: () => imageView(context, storeDetails.storeName ?? '',
                    Config.imageURL + (storeDetails.storeProfilePic ?? '')),
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
                                (storeDetails.storeProfilePic ?? ''),
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
                                "${storeDetails.storeName?.toUpperCase()}",
                                maxLines: isMobile ? 2 : 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: isMobile ? 12 : 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                storeDetails.storeCategory ?? '',
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
                                "+971 ${storeDetails.storeContactDetails}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: isMobile ? 12 : 14,
                                  color: themeChange.theme == ThemeMode.light
                                      ? kblack
                                      : kwhite,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              kheight,
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
                                if (storeDetails.userId == null) {}
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
                    // if (!(storeDetails.isWhiteLabelApp ?? false))
                    //   CustomButton(
                    //     width: 180,
                    //     onTap: () {
                    //       Provider.of<DashboardProvider>(context, listen: false)
                    //           .registerStoreAsWhitelabel(
                    //         storeDetails.ID,
                    //         (val) {
                    //           if (val != null) {
                    //             Utils.showToastMessage(
                    //               context,
                    //               val,
                    //               position: StyledToastPosition.top,
                    //             );
                    //           } else {
                    //             Utils.showToastMessage(
                    //               context,
                    //               'Something went wrong',
                    //               isError: true,
                    //               position: StyledToastPosition.top,
                    //             );
                    //           }
                    //         },
                    //       );
                    //     },
                    //     text: 'Apply for whitelabel',
                    //     height: 30,
                    //     textsize: 12,
                    //   )
                  ],
                ),
              ),
              kwidth,
            ],
          ),
        ],
      ),
    );
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
