import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/config.dart';
import 'package:salesapp/constant/colors/colors.dart';
import 'package:salesapp/model/franchise_member_model/franchise_member_model.dart';
import 'package:salesapp/provider/franchise_member_provider/franchise_member_provider.dart';
import 'package:salesapp/utils/utils.dart';

import '../../common_widget/custom_poppins.dart';
import '../../constant/responsive.dart';
import '../../provider/theme_provider.dart';
import '../../utils/language/local_storage.dart';
import '../information_page/information_page.dart';

class TotalTeamPage extends StatefulWidget {
  const TotalTeamPage({super.key});

  @override
  State<TotalTeamPage> createState() => _NewOnePageState();
}

class _NewOnePageState extends State<TotalTeamPage> {
  int? randomKey;

  int pageNumber = 1;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    randomKey = Random().nextInt(1000);
    // Initially, show all users
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FranchiseMemberProvider>(context, listen: false)
          .fetchAllFranchiseMember();
    });
  }

  bool isActive = true;

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
        title: CustomPoppinsText(
          text: "${tr(context).total} ${tr(context).team}",
          color: kwhite,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 15),
        child:
            Consumer<FranchiseMemberProvider>(builder: (context, model, child) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: themeChange.theme == ThemeMode.light
                      ? kwhite
                      : const Color.fromARGB(255, 98, 97, 97),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, top: 20, right: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      themeChange.theme == ThemeMode.light
                                          ? Colors.deepOrange
                                          : kblack,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  model.setTotalMember(0);
                                  // model.filterUsers('total');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomPoppinsText(
                                        text:
                                            "${tr(context).total} ${tr(context).member}",
                                        color: kwhite,
                                        textAlign: TextAlign.center,
                                        fontSize: Responsive.isMobile(context)
                                            ? 12
                                            : 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      CustomPoppinsText(
                                        text:
                                            "${model.franchiseModel?.total ?? 0}",
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: kwhite,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          // Container(
                          //   height:70,
                          //   width: 2,
                          //   color: greyColor,
                          // ),
                          // SizedBox(width: 10,),
                          Expanded(
                            child: Container(
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      themeChange.theme == ThemeMode.light
                                          ? const Color(0xff2d9431)
                                          : kblack,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  model.setTotalMember(1);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomPoppinsText(
                                        text:
                                            "${tr(context).active} ${tr(context).member}",
                                        color: kwhite,
                                        textAlign: TextAlign.center,
                                        fontSize: Responsive.isMobile(context)
                                            ? 12
                                            : 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      CustomPoppinsText(
                                        text:
                                            "${model.franchiseModel?.activeCount ?? 0}",
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: kwhite,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          // Container(
                          //   height:70,
                          //   width: 2,
                          //   color: greyColor,
                          // ),
                          // SizedBox(width: 10,),
                          Expanded(
                            child: Container(
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        themeChange.theme == ThemeMode.light
                                            ? kred
                                            : kblack,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {
                                  model.setTotalMember(2);
                                  // setState(() {
                                  //   model.totalmember = 2;
                                  //   model.filterUsers('inactive');
                                  // });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: Column(
                                    children: [
                                      CustomPoppinsText(
                                        text:
                                            "${tr(context).inactive} ${tr(context).member}",
                                        color: kwhite,
                                        textAlign: TextAlign.center,
                                        fontSize: Responsive.isMobile(context)
                                            ? 12
                                            : 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      CustomPoppinsText(
                                        text:
                                            "${model.franchiseModel?.inactiveCount ?? 0}",
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: kwhite,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      model.totalmember == 0
                          ? Row(
                              children: [
                                SizedBox(
                                    width: Responsive.isMobile(context)
                                        ? ResponsiveRatio().width(context, 0.12)
                                        : ResponsiveRatio()
                                            .width(context, 0.16),
                                    child: Divider(
                                      height: 1,
                                      thickness: 3,
                                      color:
                                          themeChange.theme == ThemeMode.light
                                              ? Colors.green
                                              : kwhite,
                                    )),
                              ],
                            )
                          : model.totalmember == 1
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: Responsive.isMobile(context)
                                            ? ResponsiveRatio()
                                                .width(context, 0.12)
                                            : ResponsiveRatio()
                                                .width(context, 0.16),
                                        child: Divider(
                                          height: 1,
                                          thickness: 3,
                                          color: themeChange.theme ==
                                                  ThemeMode.light
                                              ? Colors.green
                                              : kwhite,
                                        )),
                                  ],
                                )
                              : model.totalmember == 2
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: Responsive.isMobile(context)
                                              ? ResponsiveRatio()
                                                  .width(context, 0.12)
                                              : ResponsiveRatio()
                                                  .width(context, 0.16),
                                          child: Divider(
                                            height: 1,
                                            thickness: 3,
                                            color: themeChange.theme ==
                                                    ThemeMode.light
                                                ? Colors.green
                                                : kwhite,
                                          ),
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DottedLine(
                dashLength: 20,
                dashGapLength: 11,
                lineThickness: 1,
                dashColor:
                    themeChange.theme == ThemeMode.light ? kblack : kwhite,
              ),
              const SizedBox(
                height: 20,
              ),
              model.totalmember == 0
                  ? CustomPoppinsText(
                      text: "${tr(context).total} ${tr(context).member}",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: themeChange.theme == ThemeMode.light
                          ? Colors.deepOrange
                          : kwhite,
                    )
                  : model.totalmember == 1
                      ? CustomPoppinsText(
                          text: "${tr(context).active} ${tr(context).member}",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: themeChange.theme == ThemeMode.light
                              ? Colors.green
                              : kwhite,
                        )
                      : model.totalmember == 2
                          ? CustomPoppinsText(
                              text:
                                  "${tr(context).inactive} ${tr(context).member}",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: themeChange.theme == ThemeMode.light
                                  ? Colors.red
                                  : kwhite,
                            )
                          : const SizedBox(),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                    controller: scrollController,
                    shrinkWrap: true,
                    itemCount: model.totalmember == 0
                        ? model.totalFranchiseMemberList?.length ?? 0
                        : model.totalmember == 1
                            ? model.activeFranchiseMemberList?.length ?? 0
                            : model.totalmember == 2
                                ? model.deactiveFranchiseMemberList?.length ?? 0
                                : 0,
                    itemBuilder: (context, index) {
                      final data = model.totalmember == 0
                          ? (model.totalFranchiseMemberList?[index])
                          : model.totalmember == 1
                              ? (model.activeFranchiseMemberList?[index])
                              : model.totalmember == 2
                                  ? (model.deactiveFranchiseMemberList?[index])
                                  : const FranchiseMemberModel();
                      // bool isAcitve = data?.status ?? false;

                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: InkWell(
                              onTap: () {
                                model.fetchFranchiseMemberAllDetails(
                                    data!.userId ?? '', (val) {
                                  if (val != null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            InformationPage(model: data),
                                      ),
                                    );
                                  } else {
                                    Utils.showToastMessage(
                                      context,
                                      tr(context).something_went_wrong,
                                      isError: true,
                                      position: StyledToastPosition.top,
                                    );
                                  }
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: themeChange.theme == ThemeMode.light
                                      ? Colors.white
                                      : const Color.fromARGB(255, 98, 97, 97),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl:
                                                  "${Config.imgkitUrl + (data?.profilePic ?? '')}?tr=w-350&ip=$randomKey",
                                              placeholder: (context, url) =>
                                                  const SizedBox(
                                                height: 100,
                                                width: 100,
                                                child: Center(
                                                  child:
                                                      CircularProgressIndicator
                                                          .adaptive(),
                                                ),
                                              ),
                                              imageBuilder:
                                                  (context, imageProvider) {
                                                CachedNetworkImage.evictFromCache(
                                                    '${Config.imgkitUrl + (data?.profilePic ?? '')}?tr=w-350&ip=$randomKey');
                                                return Container(
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.fill,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      10,
                                                    ),
                                                    border: Border.all(
                                                      color: kgrey,
                                                    ),
                                                  ),
                                                );
                                              },
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Container(
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  image: const DecorationImage(
                                                    image: AssetImage(
                                                      'assets/app_icon.png',
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    10,
                                                  ),
                                                  border: Border.all(
                                                    color: kgrey,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomPoppinsText(
                                                    text: data?.fullName ?? '',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    maxLine: 1,
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  CustomPoppinsText(
                                                    text: data?.refCode ?? '',
                                                    color: themeChange.theme ==
                                                            ThemeMode.light
                                                        ? Colors.deepOrange
                                                        : kwhite,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  CustomPoppinsText(
                                                    text: Utils.formatDateOnly(
                                                        data?.registrationDate ??
                                                            ''),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Switch(
                                                value: data?.status ?? false,
                                                onChanged: (val) {
                                                  if (!(data?.status ??
                                                      false)) {
                                                    model.addActiveMember(
                                                      data?.userId ?? '',
                                                      (val) {
                                                        if (val != null) {
                                                          Utils
                                                              .showToastMessage(
                                                            context,
                                                            val,
                                                            position:
                                                                StyledToastPosition
                                                                    .top,
                                                          );
                                                        } else {
                                                          Utils
                                                              .showToastMessage(
                                                            context,
                                                            tr(context)
                                                                .something_went_wrong,
                                                            isError: true,
                                                            position:
                                                                StyledToastPosition
                                                                    .top,
                                                          );
                                                        }
                                                      },
                                                    );
                                                  } else {
                                                    model.deactiveMember(
                                                      data?.userId ?? '',
                                                      (val) {
                                                        if (val != null) {
                                                          Utils
                                                              .showToastMessage(
                                                            context,
                                                            val,
                                                            position:
                                                                StyledToastPosition
                                                                    .top,
                                                          );
                                                        } else {
                                                          Utils
                                                              .showToastMessage(
                                                            context,
                                                            tr(context)
                                                                .something_went_wrong,
                                                            isError: true,
                                                            position:
                                                                StyledToastPosition
                                                                    .top,
                                                          );
                                                        }
                                                      },
                                                    );
                                                  }
                                                },
                                              ),
                                              (data?.status ?? false)
                                                  ? CustomPoppinsText(
                                                      text: tr(context).active,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: kgreen,
                                                    )
                                                  : CustomPoppinsText(
                                                      text:
                                                          tr(context).inactive,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: kred,
                                                    )
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
              ),
            ],
          );
        }),
      ),
    );
  }
}
