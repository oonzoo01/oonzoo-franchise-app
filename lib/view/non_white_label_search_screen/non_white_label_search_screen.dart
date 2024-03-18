import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

import '../../constant/colors/colors.dart';
import '../../provider/dashboard_provider/dashboard_provider.dart';
import '../../provider/theme_provider.dart';
import '../../utils/language/local_storage.dart';
import '../home/search/debounce.dart';
import '../home/widget/store_card.dart';

class NonWhiteLabelSearchScreen extends StatefulWidget {
  const NonWhiteLabelSearchScreen({super.key});

  @override
  State<NonWhiteLabelSearchScreen> createState() =>
      _NonWhiteLabelSearchScreenState();
}

class _NonWhiteLabelSearchScreenState extends State<NonWhiteLabelSearchScreen> {
  final _debouncer = Debouncer(milliseconds: 1 * 1000);
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (val) {
        Navigator.pop(context);
        Provider.of<DashboardProvider>(context, listen: false)
            .clearSearchField();
        Provider.of<DashboardProvider>(context, listen: false)
            .fetchFreelancerOnboardStores(
                context,
                Provider.of<DashboardProvider>(context, listen: false)
                    .pageNumber);
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: SafeArea(
            // child: CupertinoTextField(),
            child: searchFeild(),
          ),
        ),
        body: ProgressHUD(
          inAsyncCall: false,
          opacity: 0.3,
          key: scaffoldKey,
          child: SingleChildScrollView(
            // controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                filters(),
                getSellersList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget filters() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                '${tr(context).total} ${tr(context).stores}',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                (Provider.of<DashboardProvider>(context)
                            .searchStoreList
                            ?.length ??
                        0)
                    .toString(),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: lightBlue,
                ),
              ),
            ],
          ),
        ],
      ),
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

  Widget searchFeild() {
    final themeData = Provider.of<ThemeProvider>(context);
    return Row(
      children: [
        IconButton(
          onPressed: () {
            // Provider.of<AppBarProvider>(context, listen: false).setValue(false);
            Navigator.pop(context);
            Provider.of<DashboardProvider>(context, listen: false)
                .clearSearchField();
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
}
