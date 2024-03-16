import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/constant/colors/colors.dart';
import 'package:salesapp/provider/franchise_insight/franchise_insight.dart';
import 'package:salesapp/provider/theme_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../model/chart/earnings_model.dart';
import '../../../model/chart/order_model.dart';
import '../../common_widget/custom_poppins.dart';
import '../../constant/responsive.dart';
import 'widget/insight_chart.dart';

class InsightsScreen extends StatefulWidget {
  const InsightsScreen({super.key});

  @override
  State<InsightsScreen> createState() => _InsightsScreenState();
}

class _InsightsScreenState extends State<InsightsScreen> {
  String selectedValue = 'Today';

  @override
  void initState() {
    super.initState();

    // Provider.of<InsightsProvider>(context, listen: false).fetchInsights();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FranchiseInsight>(context, listen: false)
          .fetchFranchiseInsight();
    });
  }

  showDateRangePickerMethod() {
    showDateRangePicker(
      context: context,
      // initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2024),
    );
  }

  // dateTimeRangePicker() async {
  //   DateTimeRange? picked = await showDateRangePicker(
  //       context: context,
  //       firstDate: DateTime(DateTime.now().year - 5),
  //       lastDate: DateTime(DateTime.now().year + 5),
  //       initialDateRange: DateTimeRange(
  //         end: DateTime(DateTime.now().year, DateTime.now().month,
  //             DateTime.now().day + 13),
  //         start: DateTime.now(),
  //       ),
  //       builder: (context, child) {
  //         return Column(
  //           children: [
  //             ConstrainedBox(
  //               constraints: BoxConstraints(
  //                 maxWidth: 400.0,
  //               ),
  //               child: child,
  //             )
  //           ],
  //         );
  //       });
  //   print(picked);
  // }

  dialogContent() {
    return Column(
      children: [showDateRangePickerMethod()],
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    return Scaffold(
      // backgroundColor: Colors.white,
      // drawer: const SDNavigationDrawer(),
      appBar: AppBar(
        elevation: 0.5,
        title: const Text(
          'Insight',
        ),
        actions: <Widget>[
          DropdownButton<String>(
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color:
                  themeChange.theme == ThemeMode.light ? kblack : Colors.white,
            ),
            selectedItemBuilder: (BuildContext ctxt) {
              return menuItems.map<Widget>((DropdownMenuItem<String> item) {
                return DropdownMenuItem<String>(
                  value: item.value,
                  child: Text(
                    '${item.value}',
                    style: const TextStyle(
                      // color: darkOrange,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                );
              }).toList();
            },
            underline: const SizedBox(),
            icon: const Padding(
              padding: EdgeInsets.only(right: 5),
              child: Icon(Icons.arrow_drop_down_rounded),
            ),
            borderRadius: BorderRadius.circular(15),
            value: Provider.of<FranchiseInsight>(context).createdOn,
            items: menuItems,
            onChanged: (String? newValue) async {
              Provider.of<FranchiseInsight>(context, listen: false)
                  .setCreateOn(newValue);
              if (selectedValue == 'Custom') {
                log('message');
                dateTimeRangePicker(context);
                log('finish');
              }
            },
          )
        ],
      ),
      body: Consumer<FranchiseInsight>(builder: (context, model, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // const InsightsDetailWidget(),
            // divThick5,
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  CustomPoppinsText(
                    text: 'EARNINGS',
                    fontSize: 18,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: ResponsiveRatio().height(context, 0.2),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: themeChange.theme == ThemeMode.light
                      ? const Color(0xff72e3bb)
                      : const Color.fromARGB(255, 98, 97, 97),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPoppinsText(
                      text:
                          "AED ${model.franchiseInsightDetails?.totalEarning?.toStringAsFixed(2) ?? '0'}",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kwhite,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomPoppinsText(
                      text: "Total Earnings",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: kwhite,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  CustomPoppinsText(
                    text: 'Stores On-boarded',
                    fontSize: 18,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: ResponsiveRatio().height(context, 0.2),
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: themeChange.theme == ThemeMode.light
                      ? const Color(0xffde3958)
                      : const Color.fromARGB(255, 98, 97, 97),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPoppinsText(
                      text:
                          "${model.franchiseInsightDetails?.totalStores ?? '0'}",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kwhite,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomPoppinsText(
                      text: "Total Stores On-boarded",
                      textAlign: TextAlign.center,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: kwhite,
                    )
                  ],
                ),
              ),
            )
            // EarningsChart(),
            // // divThick5,
            // Divider(),
            // StoreAddedChart(),
          ],
        );
      }),
    );
  }
}

void dateTimeRangePicker(BuildContext context) async {
  final DateTimeRange? picked = await showDateRangePicker(
    builder: (context, child) {
      return Container(
        margin: EdgeInsets.symmetric(
            horizontal: 20, vertical: MediaQuery.of(context).size.width * 0.3),
        child: Theme(
          data: ThemeData.light().copyWith(
            primaryColor: lightOrange,
            colorScheme: const ColorScheme.light(
              primary: darkOrange,
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        ),
      );
    },
    context: context,
    lastDate: DateTime(2024),
    firstDate: DateTime.now(),
  );
  if (picked != null) {
    log(picked.toString());
  }
}

class StoreAddedChart extends StatelessWidget {
  const StoreAddedChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizerUtil.deviceType == DeviceType.tablet
          ? MediaQuery.of(context).size.width / 2
          : MediaQuery.of(context).size.width * 0.68,
      child: ChartInsightWidget(
        yAxis: CategoryAxis(
          maximum: 16,
          minimum: 2,
          labelStyle: GoogleFonts.poppins(
            letterSpacing: 1,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        chartTitle: 'STORE ADDED',
        axisTitle: 'VIEW ALL STORES',
        chartDetail: <StackedColumnSeries<OrderModel, double>>[
          StackedColumnSeries<OrderModel, double>(
            dataSource: OrderModel.orderModel,
            xValueMapper: (OrderModel data, _) => data.xAxis,
            yValueMapper: (OrderModel data, _) => data.yAxis,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
            ),
            gradient: chartGradient(),
          ),
        ],
      ),
    );
  }
}

LinearGradient chartGradient() {
  return LinearGradient(
    colors: <Color>[
      kwhite,
      lightOrange,
      darkOrange,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: const <double>[
      0.2,
      0.5,
      0.7,
    ],
  );
}

// class InsightsDetailWidget extends StatelessWidget {
//   const InsightsDetailWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: const EdgeInsets.all(5),
//         padding: const EdgeInsets.symmetric(
//           horizontal: 5,
//           vertical: 15,
//         ),
//         decoration: BoxDecoration(
//             color: Provider.of<ThemeProvider>(context).theme == ThemeMode.light
//                 ? kwhite
//                 : kblack,
//             boxShadow: [
//               BoxShadow(
//                 offset: const Offset(0.0, 0.75),
//                 color: Colors.grey.shade400,
//                 blurRadius: 3,
//               )
//             ],
//             borderRadius: BorderRadius.circular(5)),
//         // color: kwhite,
//         child: Consumer<InsightsProvider>(
//           builder: (context, model, child) {
//             return Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 const InsightDetails(
//                   count: "100000",
//                   info: 'All On-boarded Stores',
//                 ),
//                 // InsightDetails(
//                 //   count: '100000',
//                 //   info: 'Added Extra',
//                 // ),
//                 SizedBox(
//                   height: 50,
//                   child: VerticalDivider(
//                     color: Provider.of<ThemeProvider>(context).theme ==
//                             ThemeMode.light
//                         ? Colors.grey
//                         : kwhite,
//                   ),
//                 ),
//                 const InsightDetails(
//                   count: 'AED 10000000',
//                   info: 'Earnings',
//                 ),
//               ],
//             );
//           },
//         ));
//   }
// }

class EarningsChart extends StatelessWidget {
  const EarningsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizerUtil.deviceType == DeviceType.tablet
          ? MediaQuery.of(context).size.width / 2
          : MediaQuery.of(context).size.width * 0.68,
      child: ChartInsightWidget(
        yAxis: CategoryAxis(
          maximum: 250,
          interval: 50,
          minimum: 50,
          isVisible: true,
          labelStyle: GoogleFonts.poppins(
            letterSpacing: 1,
            // color: kblack,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        chartTitle: 'EARNINGS',
        axisTitle: 'VIEW ALL TRANSACTIONS',
        chartDetail: <StackedColumnSeries<EarningModel, double>>[
          StackedColumnSeries<EarningModel, double>(
            dataSource: EarningModel.earningModel,
            xValueMapper: (EarningModel data, _) => data.xAxis,
            yValueMapper: (EarningModel data, _) => data.yAxis,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
            ),
            gradient: chartGradient(),
          ),
        ],
      ),
    );
  }
}

List<DropdownMenuItem<String>> menuItems = <DropdownMenuItem<String>>[
  dropDownMenuItem('Today', 'Today'),
  dropDownMenuItem('LastWeek', 'Last Week'),
  dropDownMenuItem('LastMonth', 'Last Month'),
  dropDownMenuItem('LastYear', 'Last Year'),
  dropDownMenuItem('Custom', 'Custom'),
];

DropdownMenuItem<String> dropDownMenuItem(
  String value,
  String text,
) {
  return DropdownMenuItem<String>(
    value: value,
    child: Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
    ),
  );
}
