import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/constant/colors/colors.dart';
import 'package:salesapp/constant/size/size.dart';
import 'package:salesapp/main.dart';
import 'package:salesapp/model/profile_model/profile_model.dart';
import 'package:salesapp/provider/auth_provider/register_provider.dart';
import 'package:salesapp/utils/utils.dart';
import 'package:salesapp/view/partner_page/widget/language_change.dart';
import 'package:salesapp/view/profile_editing_screen/profile_editing_screen.dart';

import '../../api/shared_service.dart';
import '../../common_widget/custom_poppins.dart';
import '../../config.dart';
import '../../constant/responsive.dart';
import '../../provider/profile_provider/profile_provider.dart';
import '../../provider/theme_provider.dart';
import '../../utils/language/local_storage.dart';
import '../change_password/change_password.dart';
import '../delete_account/delete_account.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int randomKey = 0;
  @override
  void initState() {
    super.initState();
    randomKey = Random().nextInt(100);
  }

  // bool isDarkmode = false;
  bool isnotifiction = true;
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color(0xff983b02),
            statusBarIconBrightness: Brightness.light),
      ),
      backgroundColor: themeChange.theme == ThemeMode.light
          ? Colors.deepOrange
          : const Color.fromARGB(255, 98, 97, 97),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(clipBehavior: Clip.none, children: [
            Container(
              decoration: BoxDecoration(
                color: themeChange.theme == ThemeMode.light
                    ? Colors.grey.shade200
                    : kblack,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              height: ResponsiveRatio().height(context, 0.7),
              width: double.infinity,
              child: Column(
                children: [
                  FranchiseUserDetails(themeChange: themeChange),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        decoration: BoxDecoration(
                            color: themeChange.theme == ThemeMode.light
                                ? Colors.grey.shade200
                                : kblack,
                            borderRadius: BorderRadius.circular(10)),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color:
                                          themeChange.theme == ThemeMode.light
                                              ? kwhite
                                              : kblack,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.dark_mode,
                                      // color:
                                      //     themeChange.theme == ThemeMode.light
                                      //         ? kblack
                                      //         : kwhite,
                                    ),
                                    title: CustomPoppinsText(
                                      text: tr(context).darkmode,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    trailing: Switch(
                                      activeColor: korange,
                                      onChanged: (val) {
                                        final provider =
                                            Provider.of<ThemeProvider>(context,
                                                listen: false);
                                        provider.setTheme(val);
                                        // setState(() {
                                        //   isDarkmode = val;
                                        // });
                                      },
                                      value: themeChange.isDarkMode,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: themeChange.theme == ThemeMode.light
                                        ? kwhite
                                        : kblack,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.notifications,
                                      // color: ,
                                    ),
                                    title: CustomPoppinsText(
                                      text: tr(context).notification,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    trailing: Switch(
                                      activeColor: korange,
                                      onChanged: (val) {
                                        setState(() {
                                          isnotifiction = val;
                                        });
                                      },
                                      value: isnotifiction,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: ListModel.listmodel().length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: themeChange.theme ==
                                                    ThemeMode.light
                                                ? kwhite
                                                : kblack,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: ListTile(
                                          onTap: () {
                                            if (index == 1) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LagnuageUpdate(),
                                                ),
                                              );
                                            }
                                            if (index == 2) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ChangePassword(),
                                                ),
                                              );
                                            } else if (index == 3) {
                                              Provider.of<RegisterProvider>(
                                                      context,
                                                      listen: false)
                                                  .fetchProfileData(
                                                Provider.of<ProfileProvider>(
                                                            context,
                                                            listen: false)
                                                        .profileDetails ??
                                                    const ProfileModel(),
                                              );
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProfileEditingPage(
                                                    profileModel: Provider.of<
                                                                    ProfileProvider>(
                                                                context,
                                                                listen: false)
                                                            .profileDetails ??
                                                        const ProfileModel(),
                                                  ),
                                                ),
                                              );
                                            } else if (index == 5) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute<
                                                    DeleteAccountScreen>(
                                                  builder: (BuildContext
                                                          context) =>
                                                      const DeleteAccountScreen(),
                                                ),
                                              );
                                            } else if (index == 6) {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                  title: Text(
                                                    tr(context).confirmation,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  content: Text(
                                                    tr(context)
                                                        .do_you_want_logout,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  actions: [
                                                    ElevatedButton(
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStatePropertyAll(
                                                                lightOrange),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        tr(context).no,
                                                        style: const TextStyle(
                                                            color: kwhite),
                                                      ),
                                                    ),
                                                    ElevatedButton(
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStatePropertyAll(
                                                                lightOrange),
                                                      ),
                                                      onPressed: () {
                                                        SharedService.logout();
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        tr(context).yes,
                                                        style: const TextStyle(
                                                            color: kwhite),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                          },
                                          leading: Icon(
                                            ListModel.listmodel()[index].icon,
                                            // color: kblack,
                                          ),
                                          title: CustomPoppinsText(
                                            text: ListModel.listmodel()[index]
                                                .title,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            //
            Positioned(
                top: -40,
                right: 0,
                left: 0,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.deepOrange, width: 3),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        "${Config.imageURL + (Provider.of<ProfileProvider>(context, listen: true).profileDetails?.profilePic ?? '')}?ip=$randomKey",
                    placeholder: (context, url) => const SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    ),
                    imageBuilder: (context, imageProvider) {
                      CachedNetworkImage.evictFromCache(Config.imgkitUrl +
                          (Provider.of<ProfileProvider>(context, listen: true)
                                  .profileDetails
                                  ?.profilePic ??
                              ''));
                      return Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                    errorWidget: (context, url, error) => const Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.grey,
                    ),
                  ),
                ))
          ]),
        ],
      ),
    );
  }
}

class FranchiseUserDetails extends StatelessWidget {
  const FranchiseUserDetails({
    super.key,
    required this.themeChange,
  });

  final ThemeProvider themeChange;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (context, value, _) {
      final data = value.profileDetails;
      return Container(
        decoration: BoxDecoration(
          color: themeChange.theme == ThemeMode.light ? kwhite : kblack,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const Divider(),
            const SizedBox(height: 5),
            CustomPoppinsText(
              text: data?.fullName ?? '',
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPoppinsText(
                  text: '${tr(context).redcode}: ',
                  fontWeight: FontWeight.w600,
                ),
                CustomPoppinsText(
                  text: data?.refCode ?? '',
                  fontWeight: FontWeight.w600,
                  color: themeChange.theme == ThemeMode.light
                      ? Colors.black.withOpacity(0.6)
                      : kwhite,
                ),
                kwidth,
                GestureDetector(
                  onTap: () {
                    Utils.copyUrl(
                      data?.refCode ?? '',
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
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPoppinsText(
                  text: '${tr(context).dob}: ',
                  fontWeight: FontWeight.w600,
                ),
                CustomPoppinsText(
                  text:
                      Utils.formatDateOnly(data?.dateofBirth ?? DateTime.now()),
                  fontWeight: FontWeight.w600,
                  color: themeChange.theme == ThemeMode.light
                      ? Colors.black.withOpacity(0.6)
                      : kwhite,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPoppinsText(
                  text: "${tr(context).email}: ",
                  fontWeight: FontWeight.w600,
                ),
                CustomPoppinsText(
                  text: data?.email ?? '',
                  fontWeight: FontWeight.w600,
                  color: themeChange.theme == ThemeMode.light
                      ? Colors.black.withOpacity(0.6)
                      : kwhite,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      );
    });
  }
}

class ListModel {
  IconData icon;
  String title;

  ListModel(this.icon, this.title);

  static List<ListModel> listmodel() {
    return [
      ListModel(Icons.messenger, tr(navigatorKey.currentContext!).conversation),
      ListModel(Icons.language, tr(navigatorKey.currentContext!).language),
      ListModel(Icons.lock, tr(navigatorKey.currentContext!).change_password),
      ListModel(Icons.edit, tr(navigatorKey.currentContext!).edit_profile),
      ListModel(
          Icons.local_offer, tr(navigatorKey.currentContext!).incentive_offer),
      ListModel(Icons.delete, tr(navigatorKey.currentContext!).delete_account),
      ListModel(Icons.logout, tr(navigatorKey.currentContext!).logout),
    ];
  }
}
