import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'constant/colors/colors.dart';

class TEsting extends StatefulWidget {
  const TEsting({super.key});

  @override
  State<TEsting> createState() => _TEstingState();
}

class _TEstingState extends State<TEsting> {
  @override
  void initState() {
    createPos();
    super.initState();
  }

  late Uint8List val;

  createPos() async {
    val = await generatePdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: darkOrange,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        title: Text(
          'Contract pdf'.toUpperCase(),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, ImageView.r,
                    arguments: {'i': val});
              },
              child: const Text('sdfk'))
        ],
      ),
      body: Align(
        alignment: Alignment.center,
        child: Center(
          child: Container(
            color: kwhite,
            alignment: Alignment.center,
            child: Theme(
              data: ThemeData.light().copyWith(scaffoldBackgroundColor: kwhite),
              child: InteractiveViewer(
                child: PdfPreview(
                  dpi: 200,
                  maxPageWidth: double.infinity,
                  pdfPreviewPageDecoration: BoxDecoration(
                    color: kwhite,
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [],
                  ),
                  dynamicLayout: false,
                  useActions: false,
                  shouldRepaint: false,
                  canDebug: false,
                  allowSharing: false,
                  allowPrinting: false,
                  canChangeOrientation: false,
                  canChangePageFormat: false,
                  build: (format) => generatePdf(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<Uint8List> generatePdf() async {
    final doc = pw.Document(title: 'Contract with OONZOO PORTAL LLC');
    final logo = pw.MemoryImage(
        (await rootBundle.load('assets/images/OonzooLogo1.png'))
            .buffer
            .asUint8List());

    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a6,
        // mainAxisAlignment: pw.MainAxisAlignment.center,
        // pageTheme: pageTheme,
        header: (context) {
          return pw.Column(
            children: [
              pw.Image(
                logo,
                alignment: pw.Alignment.center,
                fit: pw.BoxFit.contain,
                width: 200,
              ),
              pw.Text(
                '202,1401,1404, Al-Moosa Tower-2,\nShiekh Zayed Road, Dubai',
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.normal,
                  fontSize: 12,
                ),
              ),
              pw.Text(
                'Contact Us : 1234567890',
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.normal,
                  fontSize: 12,
                ),
              ),
              pw.Divider(),
            ],
          );
        },
        footer: (context) {
          return pw.Column(children: [
            pw.Divider(),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
              children: [
                pw.Expanded(
                  child: pw.Column(
                    children: [
                      pw.Text(
                        'This is Your Offical Receipt',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        'Thank You',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ]);
        },
        build: (context) => [
          pw.Container(
            child: pw.Column(
              children: [
                priceInformation(
                  text: 'Total Price',
                  price: 49,
                ),
                priceInformation(
                  text: 'Tax (5%)',
                  price: 2,
                ),
                priceInformation(
                  text: 'Total Service Charge',
                  price: 5,
                ),
                priceInformation(
                  text: 'Cash Handling Fee',
                  price: 4,
                ),
                pw.Divider(),
                priceInformation(
                  text: 'Grand Total',
                  price: 56,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    // final byte =
    await doc.save();
    final imageOutput = await getExternalStorageDirectory();
    final imageFile = File('${imageOutput!.path}/contract.pdf');
    await imageFile.writeAsBytes(await doc.save());
    // Provider.of<ContractProvider>(context, listen: false)
    //     .setPaymentReciept(imageFile.path);

    return doc.save();
  }

  pw.Widget priceInformation({required String text, required double price}) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(8.0),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(
            text,
            style: pw.TextStyle(
              fontSize: text == 'Grand Total' ? 14 : 12,
              fontWeight: text == 'Grand Total'
                  ? pw.FontWeight.bold
                  : pw.FontWeight.normal,
            ),
          ),
          pw.Text(
            'AED $price',
            style: pw.TextStyle(
              fontSize: text == 'Grand Total' ? 14 : 12,
              fontWeight: text == 'Grand Total'
                  ? pw.FontWeight.bold
                  : pw.FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class ImageView extends StatefulWidget {
  const ImageView({super.key});

  static String r = 'a';
  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  static Uint8List? viewImage;

  @override
  void didChangeDependencies() {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments != null) {
      Map? qArguments = arguments as Map;

      viewImage = qArguments['i'];
    }

    super.didChangeDependencies();
  }

  final Future<Uint8List> imageFuture =
      fetchImageData(); // Replace with your actual image fetching logic

  static Future<Uint8List> fetchImageData() async {
    // Replace with your image fetching logic (e.g., network call, file reading, etc.)
    await Future.delayed(const Duration(seconds: 2));
    return Uint8List.fromList(viewImage!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Uint8List>(
          future: imageFuture,
          builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('Failed to load image');
            } else if (snapshot.hasData) {
              return Image.memory(snapshot.data!);
            } else {
              return const Text('No image data available');
            }
          },
        ),
      ),
    );
  }
}
