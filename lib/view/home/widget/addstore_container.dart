// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// import '../../../constant/colors/colors.dart';
// import '../../../main.dart';
// import '../../../provider/stores_provider.dart';
// import '../../seller-edit/seller-addedit.dart';

// class AddStoreContainer extends StatelessWidget {
//   const AddStoreContainer({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Provider.of<StoresProvider>(context, listen: false).addStore();
//         navigatorKey.currentState!.pushNamed(
//           AddEditStore.routeName,
//           arguments: {
//             "isEditMode": false,
//           },
//         );
//       },
//       // Add Store container
//       child: Container(
//         margin: const EdgeInsets.all(10),
//         padding: const EdgeInsets.symmetric(
//           horizontal: 30,
//           vertical: 5,
//         ),
//         decoration: BoxDecoration(
//           color: lightOrange,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Row(
//           children: <Widget>[
//             const Icon(
//               Icons.add,
//               color: kwhite,
//               size: 20,
//             ),
//             Text(
//               'ADD STORE',
//               style: GoogleFonts.poppins(
//                 color: kwhite,
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
