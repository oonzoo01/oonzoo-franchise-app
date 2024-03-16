import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartInsightWidget extends StatelessWidget {
  const ChartInsightWidget({
    super.key,
    required this.chartTitle,
    required this.axisTitle,
    required this.chartDetail,
    this.yAxis,
  });
  final String chartTitle;
  final String axisTitle;
  final dynamic chartDetail;
  final ChartAxis? yAxis;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
      ),
      child: SfCartesianChart(
        title: ChartTitle(
          alignment: ChartAlignment.near,
          borderWidth: 6,
          text: chartTitle,
          textStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        primaryXAxis: CategoryAxis(
          isVisible: true,
          labelStyle: GoogleFonts.poppins(
            letterSpacing: 1,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          title: AxisTitle(
            text: axisTitle,
            textStyle: GoogleFonts.poppins(
              letterSpacing: 1,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 2.1,
              // color: kwhite,
              // backgroundColor: Colors.orange,
            ),
          ),
          // arrangeByIndex: true,
          visibleMaximum: 7,
        ),
        primaryYAxis: yAxis,
        zoomPanBehavior: ZoomPanBehavior(
          enablePanning: true,
        ),
        series: chartDetail,
      ),
    );
  }
}
