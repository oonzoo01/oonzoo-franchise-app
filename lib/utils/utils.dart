import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:shimmer/shimmer.dart';

class Utils {
  static void showToastMessage(
    context,
    String message, {
    bool isError = false,
    StyledToastPosition position = StyledToastPosition.center,
  }) {
    showToast(
      message,
      context: context,
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: position,
      animDuration: const Duration(seconds: 1),
      duration: const Duration(seconds: 4),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
      backgroundColor: isError ? Colors.red : Colors.green,
    );
  }

  static showMessage(
    BuildContext context,
    String title,
    String message,
    String buttonText,
    Function onPressed, {
    bool isConfirmationDialog = false,
    String buttonText2 = "",
    Function? onPressed2,
    bool dismiss = true,
  }) {
    showDialog(
      barrierDismissible: dismiss,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                onPressed();
              },
              child: Text(buttonText),
            ),
            Visibility(
              visible: isConfirmationDialog,
              child: TextButton(
                onPressed: () {
                  onPressed2!();
                },
                child: Text(buttonText2),
              ),
            ),
          ],
        );
      },
    );
  }

  static formatTime(val) {
    if (val == "") {
      val = "00:00";
    }
    var inputFormat = DateFormat('dd/MM/yyyy HH:mm');
    var inputDate =
        inputFormat.parse('31/12/2000 $val'); // <-- dd/MM 24H format

    var outputFormat = DateFormat('hh:mm a');
    var outputTime = outputFormat.format(inputDate);

    return outputTime;
  }

  static String formatTimeOnly(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }

  static formatDate(inputDate) {
    var ddFormat = DateFormat('dd MMM yyyy, HH:mm a');

    var outputTime = ddFormat.format(inputDate);

    return outputTime;
  }

  static formatDateOnly(inputDate) {
    var ddFormat = DateFormat('dd-MM-yyyy');

    var outputTime = ddFormat.format(inputDate);

    return outputTime;
  }

  static Future<void> copyUrl(String copyText, context) async {
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

  static photoShimmer(double width, double height) {
    return Shimmer(
      gradient: const LinearGradient(
        colors: [
          Color(0xFFEBEBF4),
          Color(0xFFF4F4F4),
          Color(0xFFEBEBF4),
        ],
        stops: [
          0.1,
          0.3,
          0.4,
        ],
        begin: Alignment(-1.0, -0.3),
        end: Alignment(1.0, 0.3),
        tileMode: TileMode.clamp,
      ),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  static openDatePicker(
    context,
    initialValue, {
    currentDate = DateTime.now,
    isRangeDatePicker = false,
    firstDate,
  }) async {
    final values = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        // dayTextStyle: dayTextStyle,

        calendarType: isRangeDatePicker
            ? CalendarDatePicker2Type.range
            : CalendarDatePicker2Type.single,
        selectedDayHighlightColor: Colors.purple[800],
        closeDialogOnCancelTapped: true,
        firstDayOfWeek: 1,
        firstDate: firstDate,
        weekdayLabelTextStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
        controlsTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        // centerAlignModePickerButton: true,
        // customModePickerButtonIcon: const SizedBox(),
        currentDate: currentDate,
      ),
      dialogSize: const Size(325, 400),
      borderRadius: BorderRadius.circular(15),
      dialogBackgroundColor: Colors.white,
    );

    return values;
  }

  static DateTime convertToDateTimeObject(timeString) {
    List<String> timeParts = timeString.split(':');
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);

    DateTime now = DateTime.now();

    DateTime storeTime = DateTime(now.year, now.month, now.day, hour, minute);
    return storeTime;
  }
}
