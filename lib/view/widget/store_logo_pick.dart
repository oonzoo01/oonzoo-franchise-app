// import 'dart:io';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';

// import '../../config.dart';
// import '../../provider/stores_provider.dart';

// class LogoImageWidget extends StatefulWidget {
//   const LogoImageWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<LogoImageWidget> createState() => _LogoImageWidgetState();
// }

// class _LogoImageWidgetState extends State<LogoImageWidget> {
//   final ImagePicker picker = ImagePicker();
//   XFile? logoImage;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           showModalBottomSheet<void>(
//             context: context,
//             builder: (BuildContext context) => changeLogoImageBottomSheet(),
//           );
//         });
//       },
//       child: SizedBox(
//         width: 120,
//         height: 120,

//         child: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//           // color: kgreen,
//           child: Provider.of<StoresProvider>(context, listen: false)
//                       .storeDetails!
//                       .storeProfilePic ==
//                   null
//               ? Image.asset(
//                   'assets/images/add-photo.png',
//                 )
//               : Provider.of<StoresProvider>(context, listen: false)
//                       .storeDetails!
//                       .storeProfilePic!
//                       .isNotEmpty
//                   ? SizedBox(
//                       child: Consumer<StoresProvider>(
//                         builder: (context, value, child) {
//                           return logoImage != null
//                               ? Image.file(File(logoImage!.path))
//                               : CachedNetworkImage(
//                                   imageUrl: Config.imageURL +
//                                       value.storeDetails!.storeProfilePic!,
//                                   fit: BoxFit.contain,
//                                   placeholder: (context, url) => const SizedBox(
//                                     height: 60,
//                                     child: Center(
//                                       child: CircularProgressIndicator(),
//                                     ),
//                                   ),
//                                   errorWidget: (context, url, error) =>
//                                       const Icon(Icons.error),
//                                 );
//                         },
//                       ),
//                     )
//                   : SizedBox(
//                       height: 70,
//                       child: Image.asset(
//                         "assets/images/no-photo.png",
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//         ),
// //!testing
//       ),
//     );
//   }

//   //! Image Picker From Gallery/Camera for Logo
//   Future<void> takeLogoImage(
//       ImageSource src, StoresProvider logoImageSave) async {
//     final XFile? pickedLogoImage = await ImagePicker().pickImage(source: src);
//     setState(() {
//       logoImage = pickedLogoImage;
//       // logoImageSave.setStoreProfilePic(logoImage!.path);
//     });
//   }

//   Widget changeLogoImageBottomSheet() {
//     var logoImageProvider = Provider.of<StoresProvider>(context, listen: false);
//     return Container(
//       height: 100.0,
//       width: double.infinity,
//       margin: const EdgeInsets.symmetric(
//         horizontal: 20,
//         vertical: 20,
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           Text(
//             'Choose Photo',
//             style: GoogleFonts.poppins(
//               fontSize: 20.0,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               TextButton.icon(
//                 onPressed: () {
//                   takeLogoImage(ImageSource.camera, logoImageProvider);
//                   Navigator.pop(context);
//                 },
//                 icon: const Icon(Icons.add_a_photo),
//                 label: const Text('Camera'),
//               ),
//               TextButton.icon(
//                 onPressed: () {
//                   takeLogoImage(ImageSource.gallery, logoImageProvider);
//                   Navigator.pop(context);
//                 },
//                 icon: const Icon(Icons.collections),
//                 label: const Text('Gallery'),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }