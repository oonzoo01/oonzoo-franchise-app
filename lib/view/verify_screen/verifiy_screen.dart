import 'dart:async';

import 'package:flutter/material.dart';
import 'package:salesapp/constant/colors/colors.dart';

class ScreenVerify extends StatefulWidget {
  const ScreenVerify({super.key});

  @override
  State<ScreenVerify> createState() => _ScreenVerifyState();
}

class _ScreenVerifyState extends State<ScreenVerify> {
  // int _seconds = 0;
  StreamController<int>? _events;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startTimer();
      // dialog();
    });
  }

  void alertD(BuildContext ctx) {
    var alert = AlertDialog(
        title: const Text('Verification'),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        backgroundColor: Colors.grey[100],
        elevation: 0.0,
        content: StreamBuilder<int>(
            stream: _events?.stream,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return const SizedBox(
                height: 100,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // Padding(
                      //     padding: const EdgeInsets.only(
                      //         top: 10, left: 10, right: 10, bottom: 15),
                      //     child: Text(
                      //       'Enter Code',
                      //       style: TextStyle(
                      //           color: Colors.green[800],
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: 16),
                      //     )),
                      // Container(
                      //   height: 70,
                      //   width: 180,
                      //   child: TextFormField(
                      //     style: TextStyle(
                      //         fontSize: 20, fontWeight: FontWeight.bold),
                      //     textAlign: TextAlign.center,
                      //     decoration: InputDecoration(
                      //       enabledBorder: OutlineInputBorder(
                      //           borderSide:
                      //               BorderSide(color: Colors.green, width: 0.0)),
                      //     ),
                      //     keyboardType: TextInputType.number,
                      //     maxLength: 10,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 1,
                      // ),
                      // Text('00:${snapshot.data.toString()}'),
                      // kheight15,
                      Text(
                        'Your Profile under verification \n It will take 12 hours',
                        style: TextStyle(fontSize: 14),
                      )
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: <Widget>[
                      //     ClipRRect(
                      //       borderRadius: BorderRadius.circular(25),
                      //       child: Material(
                      //         child: InkWell(
                      //           onTap: () {
                      //             //Navigator.of(ctx).pushNamed(SignUpScreenSecond.routeName);
                      //           },
                      //           child: Container(
                      //             width: 100,
                      //             height: 50,
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(25),
                      //               gradient: LinearGradient(
                      //                   colors: [
                      //                     Colors.green,
                      //                     Colors.grey,
                      //                   ],
                      //                   begin: Alignment.topLeft,
                      //                   end: Alignment.bottomRight),
                      //             ),
                      //             child: Center(
                      //                 child: Text(
                      //               'Validate',
                      //               style: TextStyle(
                      //                   color: Colors.white,
                      //                   fontSize: 16,
                      //                   fontWeight: FontWeight.bold),
                      //             )),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     ClipRRect(
                      //       borderRadius: BorderRadius.circular(25),
                      //       child: Material(
                      //         child: InkWell(
                      //           onTap: () {},
                      //           child: Container(
                      //             width: 100,
                      //             height: 50,
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(25),
                      //               gradient: LinearGradient(
                      //                   colors: [
                      //                     Colors.grey,
                      //                     Colors.green,
                      //                   ],
                      //                   begin: Alignment.topLeft,
                      //                   end: Alignment.bottomRight),
                      //             ),
                      //             child: Center(
                      //                 child: Text(
                      //               'Resend',
                      //               style: TextStyle(
                      //                   color: Colors.white,
                      //                   fontSize: 16,
                      //                   fontWeight: FontWeight.bold),
                      //             )),
                      //           ),
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ), //new column child
                    ],
                  ),
                ),
              );
            }));
    showDialog(
        context: ctx,
        builder: (BuildContext c) {
          return alert;
        });
  }

  // void dialog() {
  //   showDialog(
  //     context: context,
  //     builder: (context) => StatefulBuilder(
  //       builder: (context, setState) =>
  //       AlertDialog(
  //         title: const Text('Verification'),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Text(
  //               '$_seconds',
  //               style: const TextStyle(
  //                 color: kblack,
  //                 fontSize: 14,
  //                 fontWeight: FontWeight.w600,
  //               ),
  //             ),
  // kheight15,
  // const Text(
  //   'Your Profile under verification',
  //   style: TextStyle(fontSize: 14),
  // )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  int _counter = 0;
  Timer? _timer;
  void _startTimer() {
    _counter = 60;
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      //setState(() {
      (_counter > 0) ? _counter-- : _timer?.cancel();
      //});

      _events?.add(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              _startTimer();
              alertD(context);
            },
            child: const Text('Click')),
      ),
    );
  }
}
