import 'dart:developer';

import 'package:app_version_update/app_version_update.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/common_widget/custom_poppins.dart';
import 'package:salesapp/main.dart';
import 'package:salesapp/provider/appbar_provider.dart';
import 'package:salesapp/provider/dashboard_provider/dashboard_provider.dart';
import 'package:salesapp/provider/wallet_provider/wallet_provider.dart';
import 'package:salesapp/view/non_white_label_search_screen/non_white_label_search_screen.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

import '../../constant/colors/colors.dart';
import '../../provider/loader_provider/loader_provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../provider/theme_provider.dart';
import '../../utils/language/local_storage.dart';
import 'drawer/drawer.dart';
import 'search/debounce.dart';
import 'widget/on_board_store_list_widget.dart';
import 'widget/store_card.dart';

class DashboardPage extends StatefulWidget {
  static String routeName = '/dashboard-page';

  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final ScrollController scrollController = ScrollController();

  //late VerifyOTPPopupDialog verifyOTPPopupDialog;
  String selectedValue = 'Today';
  String selectedValueStore = 'All';
  // final searchResult = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 1 * 1000);

  int _pageNumber = 1;
  // PaginationProvider pagination = PaginationProvider();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    // Provider.of<StoresProvider>(context, listen: false).resetStreams();
    // Provider.of<StoresProvider>(context, listen: false).fetchStores(1);

    // _scrollController.addListener(() {
    //   if (_scrollController.offset ==
    //       _scrollController.position.maxScrollExtent) {
    //     Provider.of<PaginationProvider>(context, listen: false)
    //         .setPageNumber(++_page);
    //     if (Provider.of<StoresProvider>(context, listen: false)
    //             .allStores
    //             .length <
    //         Provider.of<StoresProvider>(context, listen: false).totalRecords) {
    //       Provider.of<StoresProvider>(context, listen: false)
    //           .setStatusStoreLoading();
    //       Provider.of<StoresProvider>(context, listen: false).fetchStores(
    //           Provider.of<PaginationProvider>(context, listen: false)
    //               .pageNumber);
    //     }
    //   }
    // });
    _verifyVersion();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Provider.of<ThemeProvider>(context, listen: false).setTheme(false);
      Provider.of<DashboardProvider>(context, listen: false)
          .fetchFreelancerOnboardStores(context, 1);
      Provider.of<WalletProvider>(context, listen: false)
          .fetchWalletTransactionHistory();
      scrollController.addListener(() {
        if (scrollController.offset ==
            scrollController.position.maxScrollExtent) {
          if (Provider.of<DashboardProvider>(context, listen: false)
                  .pageNumber ==
              1) {
            setState(() {
              _pageNumber = 1;
            });
          }
          if (Provider.of<DashboardProvider>(context, listen: false)
                  .onBoardStoreModel!
                  .total! >
              Provider.of<DashboardProvider>(context, listen: false)
                  .onBoardStoreList
                  .length) {
            Provider.of<DashboardProvider>(context, listen: false)
                .setPageNumber(++_pageNumber);

            Provider.of<LoaderProvider>(context, listen: false)
                .setIsLoading(true);
            Provider.of<DashboardProvider>(context, listen: false)
                .fetchFreelancerOnboardStores(
              context,
              Provider.of<DashboardProvider>(context, listen: false).pageNumber,
            );
          }
        }
      });
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
    return PopScope(
      canPop: true,
      onPopInvoked: (val) {
        // if (Provider.of<AppBarProvider>(context, listen: false).isAppbar) {
        //   Provider.of<AppBarProvider>(context, listen: false).setValue(false);
        //   Provider.of<DashboardProvider>(context, listen: false)
        //       .fetchFreelancerOnboardStores(
        //     context,
        //     Provider.of<DashboardProvider>(context, listen: false).pageNumber,
        //   );
        //   Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const DashboardPage(),
        //     ),
        //   );
        // } else {}
      },
      child: Scaffold(
        drawer: const SDNavigationDrawer(),
        // backgroundColor: HexColor("#EFEFEF"),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: SafeArea(
            // child: CupertinoTextField(),
            child: AppBarHome(),
            //  Consumer<AppBarProvider>(builder: (context, value, child) {
            //   return value.isAppbar ? searchFeild() : const AppBarHome();
            // }),
          ),
        ),
        body: RefreshIndicator.adaptive(
          onRefresh: () async {
            Provider.of<DashboardProvider>(context, listen: false)
                .fetchFreelancerOnboardStores(context, 1);
          },
          child: Consumer<LoaderProvider>(
            builder: (context, loaderModel, child) {
              return ProgressHUD(
                inAsyncCall: false,
                opacity: 0.3,
                key: scaffoldKey,
                child: SingleChildScrollView(
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      filters(),
                      // Provider.of<AppBarProvider>(context).isAppbar
                      //     ? getSellersList()
                      //     :
                      const OnboardStoreListWidget(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // Future<void> _refreshDashboard() async {
  //   Provider.of<StoresProvider>(context, listen: false).resetStreams();
  //   Provider.of<StoresProvider>(context, listen: false).fetchStores(1);
  // }

  Widget searchFeild() {
    final themeData = Provider.of<ThemeProvider>(context);
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Provider.of<AppBarProvider>(context, listen: false).setValue(false);
            Provider.of<DashboardProvider>(context, listen: false)
                .fetchFreelancerOnboardStores(
                    context,
                    Provider.of<DashboardProvider>(context, listen: false)
                        .pageNumber);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoSearchTextField(
              controller:
                  Provider.of<DashboardProvider>(context).searchController,
              placeholder: 'Search',
              style: TextStyle(
                color: themeData.theme == ThemeMode.light ? kblack : kwhite,
              ),
              backgroundColor: Colors.grey.withOpacity(0.4),
              prefixIcon: const Icon(
                CupertinoIcons.search,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
              ),
              onChanged: (value) {
                _debouncer.run(
                  () {
                    Provider.of<DashboardProvider>(context, listen: false)
                        .nonWhiteLabelSearch();
                    // Provider.of<StoresProvider>(context, listen: false)
                    //     .setSerach(value);
                  },
                );
              },
              onSuffixTap: () {
                Provider.of<DashboardProvider>(context, listen: false)
                    .clearSearchField();
              },
              onSubmitted: (String value) {
                // var _storesList = Provider.of<StoresProvider>(context, listen: false);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget getSellersList() {
    // var value = Provider.of<StoresProvider>(context);
    return Consumer<DashboardProvider>(
      builder: (context, searchModel, child) {
        if ((searchModel.searchStoreList?.isNotEmpty ?? false)
            // &&
            // searchModel.getLoadMoreStatus() != LoadMoreStatus.INITIAL
            ) {
          return Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: searchModel.searchStoreList?.length ?? 0,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return HomeMainCard(
                    index: index,
                    storeDetails: searchModel.searchStoreList![index],
                  );
                },
              ),
              // Visibility(
              //   visible:
              //       searchModel.getLoadMoreStatus() == LoadMoreStatus.LOADING,
              //   child: Container(
              //     padding: const EdgeInsets.all(5),
              //     height: 35.0,
              //     width: 35,
              //     child: const CircularProgressIndicator(),
              //   ),
              // )
            ],
          );
        }

        if ((searchModel.searchStoreList?.isEmpty ?? false)
            // &&
            // searchModel.getLoadMoreStatus() == LoadMoreStatus.STABLE
            ) {
          return Center(
            child: Lottie.asset(
              'assets/images/empty.json',
            ),
          );
        }

        return const Center(
          // child: CircularProgressIndicator(),
          child: SizedBox(),
        );
      },
    );
  }

  Widget filters() {
    final themeChange = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 6,
      ),
      child: Row(
        mainAxisAlignment: Provider.of<AppBarProvider>(context).isAppbar
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!Provider.of<AppBarProvider>(context).isAppbar)
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
                hint: CustomPoppinsText(
                  text: tr(context).select,
                ),
                icon: const Icon(
                  Icons.arrow_drop_down_sharp,
                  color: kwhite,
                ),
                alignment: AlignmentDirectional.center,
                borderRadius: BorderRadius.circular(15),
                value: Provider.of<DashboardProvider>(context, listen: true)
                        .whitelabelStatus ??
                    "All",
                items: storeItem,
                onChanged: (String? newValue) async {
                  Provider.of<DashboardProvider>(context, listen: false)
                      .setWhiteLabelStatus(newValue, context);
                  // Provider.of<StoresProvider>(context, listen: false)
                  //     .setVerifyStatus(newValue);
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
                (Provider.of<AppBarProvider>(context).isAppbar
                        ? Provider.of<DashboardProvider>(context)
                                .searchStoreList
                                ?.length ??
                            0
                        : Provider.of<DashboardProvider>(context)
                            .onBoardStoreList
                            .length)
                    .toString(),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: lightBlue,
                ),
              ),
            ],
          ),
          if (!Provider.of<AppBarProvider>(context).isAppbar)
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
              hint: CustomPoppinsText(
                text: tr(context).select,
                color: themeChange.theme == ThemeMode.light ? kblack : kwhite,
              ),
              alignment: AlignmentDirectional.centerEnd,
              borderRadius: BorderRadius.circular(15),
              value: Provider.of<DashboardProvider>(context, listen: true)
                  .createdAt,
              items: menuItems,
              onChanged: (String? newValue) async {
                if (newValue == "Custom") {
                  final values = await showCalendarDatePicker2Dialog(
                    context: context,
                    config: CalendarDatePicker2WithActionButtonsConfig(
                      // dayTextStyle: dayTextStyle,
                      calendarType: CalendarDatePicker2Type.range,
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
                    Provider.of<DashboardProvider>(context, listen: false)
                        .setCustomDates(values, context);
                  }
                } else {
                  Provider.of<DashboardProvider>(context, listen: false)
                      .setCreatedOn(newValue!, context);
                  // _page = 1;
                  // Provider.of<PaginationProvider>(context, listen: false)
                  //     .setPageNumber(_page);
                }
              },
            ),
        ],
      ),
    );
  }

  void dateTimeRangePicker(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      builder: (context, child) {
        return Center(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: MediaQuery.of(context).size.width * 0.3,
            ),
            child: child,
          ),
        );
      },
      context: context,
      lastDate: DateTime(2024),
      firstDate: DateTime.now(),
    );
    if (picked != null) {}
  }
}

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Theme.of(context).primaryColorDark,
        size: 30,
      ),
      elevation: 1,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NonWhiteLabelSearchScreen(),
              ),
            );
            // Provider.of<AppBarProvider>(context, listen: false).setValue(true);
            Provider.of<DashboardProvider>(context, listen: false)
                .clearFilter();
          },
        ),
        // const AddStoreContainer(),
      ],
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

List<DropdownMenuItem<String>> storeItem = <DropdownMenuItem<String>>[
  dropDownmenuItem('All', tr(navigatorKey.currentContext!).all),
  dropDownmenuItem('Whitelabel', tr(navigatorKey.currentContext!).whitelabel),
  dropDownmenuItem('NonWhitelabel',
      '${tr(navigatorKey.currentContext!).non}${tr(navigatorKey.currentContext!).whitelabel}'),
];

DropdownMenuItem<String> dropDownmenuItem(String value, String text) {
  return DropdownMenuItem<String>(
    value: value,
    child: Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    ),
  );
}
