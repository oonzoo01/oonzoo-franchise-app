import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/common_widget/custom_button.dart';
import 'package:salesapp/common_widget/custom_poppins.dart';
import 'package:salesapp/constant/colors/colors.dart';
import 'package:salesapp/constant/size/size.dart';
import 'package:salesapp/main.dart';
import 'package:salesapp/provider/franchise_member_provider/franchise_member_provider.dart';
import 'package:salesapp/provider/franchise_onboard_sotre_provider/franchise_onboard_store_provider.dart';
import 'package:salesapp/view/franchise_onboard_store_screen/widget/store_widget.dart';

import '../../provider/loader_provider/loader_provider.dart';
import '../../provider/theme_provider.dart';
import '../../utils/language/local_storage.dart';
import '../home/dashboard.dart';

class FranchiseOnboardStoreScreen extends StatefulWidget {
  const FranchiseOnboardStoreScreen({super.key});

  @override
  State<FranchiseOnboardStoreScreen> createState() =>
      _FranchiseOnboardStoreScreenState();
}

class _FranchiseOnboardStoreScreenState
    extends State<FranchiseOnboardStoreScreen> {
  String selectedValue = '';
  ScrollController scrollController = ScrollController();
  int _pageNumber = 1;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        if (Provider.of<FranchiseOnboardStoreProvider>(context, listen: false)
                .pageNumber ==
            1) {
          setState(() {
            _pageNumber = 1;
          });
        }
        if (Provider.of<FranchiseOnboardStoreProvider>(context, listen: false)
                .onBoardStoreModel!
                .total! >
            Provider.of<FranchiseOnboardStoreProvider>(context, listen: false)
                .franchiseOnBoardStoreList
                .length) {
          Provider.of<FranchiseOnboardStoreProvider>(context, listen: false)
              .setPageNumber(++_pageNumber);

          Provider.of<LoaderProvider>(context, listen: false)
              .setIsLoading(true);
          Provider.of<FranchiseOnboardStoreProvider>(context, listen: false)
              .fetchFranchiseOnboardStore(
            context,
            Provider.of<FranchiseOnboardStoreProvider>(context, listen: false)
                .pageNumber,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    return Scaffold(
      // backgroundColor: kwhite,
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.black.withOpacity(0.4)),
        backgroundColor: Colors.deepOrange,
        elevation: 1,
        title: CustomPoppinsText(
          text: "${tr(context).on_board} ${tr(context).stores}",
          fontWeight: FontWeight.w500,
          color: kwhite,
          fontSize: 16,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: DropdownButton<String>(
              selectedItemBuilder: (BuildContext ctxt) {
                return storeFilter.map<Widget>(
                  (DropdownMenuItem<String> item) {
                    return DropdownMenuItem<String>(
                      value: item.value,
                      child: Text(
                        item.value!.toUpperCase(),
                        style: const TextStyle(
                          color: kwhite,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    );
                  },
                ).toList();
              },
              isDense: true,
              underline: const SizedBox(),
              // alignment: AlignmentDirectional.centerEnd,
              iconEnabledColor: kwhite,
              iconDisabledColor: kwhite,
              borderRadius: BorderRadius.circular(15),
              value: Provider.of<FranchiseOnboardStoreProvider>(context,
                          listen: true)
                      .createdMemberAt ??
                  "All",
              items: storeFilter,
              onChanged: (String? newValue) async {
                if (newValue == "Custom") {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        StatefulBuilder(builder: (context, setStates) {
                      return SizedBox(
                        height: 400,
                        width: 300,
                        child: AlertDialog(
                          title: CustomPoppinsText(
                            text: "Team Members",
                            color: themeChange.theme == ThemeMode.light
                                ? kblack
                                : kwhite,
                          ),
                          content: SizedBox(
                            height: 400,
                            width: 300,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: Provider.of<FranchiseMemberProvider>(
                                            context)
                                        .totalFranchiseMemberList
                                        ?.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  final data =
                                      Provider.of<FranchiseMemberProvider>(
                                              context)
                                          .totalFranchiseMemberList?[index];
                                  return RadioListTile(
                                    value: data?.userId ?? '',
                                    groupValue: Provider.of<
                                                FranchiseOnboardStoreProvider>(
                                            context)
                                        .selectedId,
                                    title: CustomPoppinsText(
                                      text: data?.fullName ?? '',
                                      color:
                                          themeChange.theme == ThemeMode.light
                                              ? kblack
                                              : kwhite,
                                    ),
                                    onChanged: (value) {
                                      Provider.of<FranchiseOnboardStoreProvider>(
                                              context,
                                              listen: false)
                                          .setFreelancerId(data?.userId);
                                      setStates(() {
                                        selectedValue = data?.fullName ?? '';
                                      });
                                    },
                                  );
                                }),
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomButton(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  text: "Cancel",
                                  height: 40,
                                  width: 80,
                                  textsize: 14,
                                ),
                                kwidth,
                                CustomButton(
                                  onTap: () {
                                    Provider.of<FranchiseOnboardStoreProvider>(
                                            context,
                                            listen: false)
                                        .setMemberCreatedOn(newValue);
                                    Provider.of<FranchiseOnboardStoreProvider>(
                                            context,
                                            listen: false)
                                        .setCreatedOn(null, context);
                                    Navigator.pop(context);
                                  },
                                  text: "Save",
                                  height: 40,
                                  width: 80,
                                  textsize: 14,
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
                  );
                } else {
                  Provider.of<FranchiseOnboardStoreProvider>(context,
                          listen: false)
                      .setFreelancerId(null);
                  Provider.of<FranchiseOnboardStoreProvider>(context,
                          listen: false)
                      .setMemberCreatedOn(newValue);
                  Provider.of<FranchiseOnboardStoreProvider>(context,
                          listen: false)
                      .setCreatedOn(null, context);
                  // _page = 1;
                  // Provider.of<PaginationProvider>(context, listen: false)
                  //     .setPageNumber(_page);
                }
              },
            ),
          ),
        ],
      ),
      body: Consumer<FranchiseOnboardStoreProvider>(
          builder: (context, franModel, _) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 6,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: lightOrange,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: lightOrange,
                        width: 1.2,
                      ),
                    ),
                    child: DropdownButton<String>(
                      selectedItemBuilder: (BuildContext ctxt) {
                        return storeItem.map<Widget>(
                          (DropdownMenuItem<String> item) {
                            return DropdownMenuItem<String>(
                              value: item.value,
                              child: Text(
                                item.value!,
                                style: const TextStyle(
                                  color: kwhite,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            );
                          },
                        ).toList();
                      },
                      isDense: true,
                      underline: const SizedBox(),
                      icon: const Icon(
                        Icons.arrow_drop_down_sharp,
                        color: kwhite,
                      ),
                      alignment: AlignmentDirectional.center,
                      borderRadius: BorderRadius.circular(15),
                      value: Provider.of<FranchiseOnboardStoreProvider>(context,
                                  listen: true)
                              .whitelabelStatus ??
                          'All',
                      items: storeItem,
                      onChanged: (String? newValue) async {
                        Provider.of<FranchiseOnboardStoreProvider>(context,
                                listen: false)
                            .setWhiteLabelStatus(newValue ?? '', context);
                        // _page = 1;
                        // Provider.of<PaginationProvider>(context, listen: false)
                        //     .setPageNumber(_page);
                      },
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        '${tr(context).total} ${tr(context).stores}',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        (franModel.onBoardStoreModel?.total ?? 0).toString(),
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: lightBlue,
                        ),
                      ),
                    ],
                  ),
                  DropdownButton<String>(
                    selectedItemBuilder: (BuildContext ctxt) {
                      return menuItems.map<Widget>(
                        (DropdownMenuItem<String> item) {
                          return DropdownMenuItem<String>(
                            value: item.value,
                            child: Text(
                              item.value!.toUpperCase(),
                              style: const TextStyle(
                                // color: kblack,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          );
                        },
                      ).toList();
                    },
                    isDense: true,
                    underline: const SizedBox(),
                    alignment: AlignmentDirectional.centerEnd,
                    hint: CustomPoppinsText(
                      text: tr(context).select,
                      color: themeChange.theme == ThemeMode.light
                          ? kblack
                          : kwhite,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    value: Provider.of<FranchiseOnboardStoreProvider>(context,
                            listen: true)
                        .createdAt,
                    items: menuItems,
                    onChanged: (String? newValue) async {
                      if (newValue == "Custom") {
                        final values = await showCalendarDatePicker2Dialog(
                          context: context,
                          config: CalendarDatePicker2WithActionButtonsConfig(
                            // dayTextStyle: dayTextStyle,
                            calendarType: CalendarDatePicker2Type.range,
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                            selectedDayHighlightColor: Colors.purple[800],
                            closeDialogOnCancelTapped: true,
                            firstDayOfWeek: 1,
                            weekdayLabelTextStyle: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                            controlsTextStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            // centerAlignModePickerButton: true,
                            // customModePickerButtonIcon: const SizedBox(),
                            // selectedDayTextStyle:
                            //     dayTextStyle.copyWith(color: Colors.white),
                          ),
                          dialogSize: const Size(325, 400),
                          borderRadius: BorderRadius.circular(15),
                          // initialValue:
                          //     Provider.of<StoresProvider>(context, listen: false)
                          //         .customDates!,
                          dialogBackgroundColor: Colors.white,
                        );
                        if (values != null) {
                          Provider.of<FranchiseOnboardStoreProvider>(context,
                                  listen: false)
                              .setCustomDates(values, context);
                        }
                      } else {
                        Provider.of<FranchiseOnboardStoreProvider>(context,
                                listen: false)
                            .setCreatedOn(newValue!, context);
                        // _page = 1;
                        // Provider.of<PaginationProvider>(context, listen: false)
                        //     .setPageNumber(_page);
                      }
                    },
                  ),
                ],
              ),
            ),
            if (franModel.isLoading ?? false)
              SizedBox(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.7,
                child: const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              )
            else if ((franModel.franchiseOnBoardStoreList.isEmpty))
              SizedBox(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.7,
                child: Center(
                  child: Lottie.asset(
                    'assets/images/empty.json',
                  ),
                ),
              )
            else
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        controller: scrollController,
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        itemBuilder: (context, index) {
                          final data =
                              franModel.franchiseOnBoardStoreList[index];
                          return StoreWidget(
                            storeDetails: data,
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 5),
                        itemCount: franModel.franchiseOnBoardStoreList.length,
                      ),
                    ),
                    Visibility(
                      visible: Provider.of<LoaderProvider>(context).isLoading,
                      child: const SizedBox(
                        height: 35,
                        width: 35,
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      }),
    );
  }
}

List<DropdownMenuItem<String>> menuItems = <DropdownMenuItem<String>>[
  dropDownmenuItem('Today', tr(navigatorKey.currentContext!).today),
  dropDownmenuItem('Yesterday', tr(navigatorKey.currentContext!).yesterday),
  dropDownmenuItem('Last7days',
      '${tr(navigatorKey.currentContext!).last} 7 ${tr(navigatorKey.currentContext!).days}'),
  dropDownmenuItem('30Days',
      '${tr(navigatorKey.currentContext!).last} 30 ${tr(navigatorKey.currentContext!).days}'),
  dropDownmenuItem('ThisMonth', tr(navigatorKey.currentContext!).this_month),
  dropDownmenuItem('LastMonth', tr(navigatorKey.currentContext!).last_month),
  dropDownmenuItem('Lifetime', tr(navigatorKey.currentContext!).lifetime),
  dropDownmenuItem('Custom', tr(navigatorKey.currentContext!).custom),
];
List<DropdownMenuItem<String>> storeFilter = <DropdownMenuItem<String>>[
  dropDownmenuItem('All', tr(navigatorKey.currentContext!).all),
  dropDownmenuItem('Custom', tr(navigatorKey.currentContext!).custom),
  // dropDownmenuItem('Last7days', 'Last 7 days'),
  // dropDownmenuItem('30Days', 'Last 30 days'),
  // dropDownmenuItem('ThisMonth', 'This Month'),
  // dropDownmenuItem('LastMonth', 'Last Month'),
  // dropDownmenuItem('Lifetime', 'Lifetime'),
  // dropDownmenuItem('Custom', 'Custom'),
];

List<DropdownMenuItem<String>> storeItem = <DropdownMenuItem<String>>[
  dropDownmenuItem('All', tr(navigatorKey.currentContext!).all),
  dropDownmenuItem('Whitelabel', tr(navigatorKey.currentContext!).whitelabel),
  dropDownmenuItem('NonWhitelabel',
      '${tr(navigatorKey.currentContext!).non}${tr(navigatorKey.currentContext!).whitelabel}'),
];
