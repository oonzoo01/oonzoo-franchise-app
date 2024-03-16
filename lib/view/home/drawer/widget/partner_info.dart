import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:salesapp/api/shared_service.dart';
import 'package:salesapp/constant/colors/colors.dart';
import 'package:salesapp/model/login_response.dart';

import '../../../../config.dart';
import '../../../../constant/size/size.dart';
import '../../../../utils/utils.dart';

class PartnerInformationWidget extends StatelessWidget {
  const PartnerInformationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return getStoreCategories(context);
  }

  Widget getStoreCategories(ctx) {
    return FutureBuilder(
      future: SharedService.loginDetails(),
      builder: (
        BuildContext context,
        AsyncSnapshot<LoginResponse?> model,
      ) {
        if (model.hasData) {
          return SizedBox(
            height: 195,
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(bottom: 10),
                    height: 25,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: lightOrange,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      'Franchise name',
                      style: TextStyle(color: kwhite),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      model.data!.profilePic != null
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 6),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: CircleAvatar(
                                radius: 30,
                                //   backgroundImage: NetworkImage(
                                //     Config.imageURL + model.data!.profilePic!,
                                //   ),
                                backgroundColor: Colors.transparent,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      Config.imageURL + model.data!.profilePic!,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            )
                          : const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                'assets/images/OonzooLogo2.png',
                              ),
                            ),
                      kwidth15,
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              model.data!.fullName!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            kheight,
                            Text(
                              model.data!.mobile ?? "",
                              style: const TextStyle(
                                // color: Theme.of(context).primaryColor.withOpacity(0.7),
                                fontSize: 14,
                              ),
                            ),
                            kheight,
                            Row(
                              children: [
                                Text(
                                  model.data?.refCode ?? '',
                                  style: const TextStyle(
                                    // color: IconTheme.of(context).color!.withOpacity(0.7),
                                    fontSize: 14,
                                  ),
                                ),
                                kwidth,
                                GestureDetector(
                                  onTap: () {
                                    copyUrl(
                                      model.data?.refCode ?? '',
                                      context,
                                    );
                                  },
                                  child: const Icon(
                                    Icons.copy,
                                    size: 15,
                                  ),
                                )
                              ],
                            ),
                            kheight,
                            Text(
                              model.data!.email!,
                              style: const TextStyle(
                                // color: IconTheme.of(context).color!.withOpacity(0.7),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
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

  Future<void> copyUrl(String copyText, context) async {
    if (copyText.isNotEmpty) {
      Clipboard.setData(
        ClipboardData(
          text: copyText,
        ),
      );
      Utils.showToastMessage(
        context,
        'Copied Successfully',
        position: StyledToastPosition.top,
      );
    } else {
      Utils.showToastMessage(
        context,
        'Something Wrong',
        isError: true,
        position: StyledToastPosition.top,
      );
    }
  }
}
