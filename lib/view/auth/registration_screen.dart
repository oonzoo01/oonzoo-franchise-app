import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/constant/colors/colors.dart';
import 'package:salesapp/constant/const_data.dart';
import 'package:salesapp/provider/auth_provider/register_provider.dart';
import 'package:salesapp/utils/utils.dart';

import '../../constant/responsive.dart';
import '../../model/login_response.dart';
import '../sucess_screen/sucess_screen.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key, this.loginResponse});

  final LoginResponse? loginResponse;

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String? selectnatinality;

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  final TextEditingController searchController = TextEditingController();

  List<Map<String, String>>? searchResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(lightOrange),
          ),
          onPressed: () {
            if (globalKey.currentState!.validate()) {
              if (Provider.of<RegisterProvider>(context, listen: false)
                      .deliverymanimage ==
                  null) {
                Utils.showToastMessage(
                  context,
                  "Please upload the profile photo",
                  isError: true,
                  position: StyledToastPosition.top,
                );
              } else if (Provider.of<RegisterProvider>(context, listen: false)
                      .proofIdFrontImage ==
                  null) {
                Utils.showToastMessage(
                  context,
                  "Please upload the proofId front photo",
                  isError: true,
                  position: StyledToastPosition.top,
                );
              } else if (Provider.of<RegisterProvider>(context, listen: false)
                      .proofIdBackImage ==
                  null) {
                Utils.showToastMessage(
                  context,
                  "Please upload the proofId back photo",
                  isError: true,
                  position: StyledToastPosition.top,
                );
              } else if (Provider.of<RegisterProvider>(context, listen: false)
                      .frontlicenseimage ==
                  null) {
                Utils.showToastMessage(
                  context,
                  "Please upload the license front photo",
                  isError: true,
                  position: StyledToastPosition.top,
                );
              } else if (Provider.of<RegisterProvider>(context, listen: false)
                      .backlicenseimage ==
                  null) {
                Utils.showToastMessage(
                  context,
                  "Please upload the license back photo",
                  isError: true,
                  position: StyledToastPosition.top,
                );
              } else {
                Provider.of<RegisterProvider>(context, listen: false)
                    .partnerProfileRegister(
                  (val) {
                    if (val != null) {
                      Utils.showToastMessage(
                        context,
                        val,
                        position: StyledToastPosition.top,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SuccessScreen(),
                        ),
                      );
                    } else {
                      Utils.showToastMessage(
                        context,
                        "Something went wrong",
                        isError: true,
                        position: StyledToastPosition.top,
                      );
                    }
                  },
                );
              }
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (Provider.of<RegisterProvider>(context).isRegLoading)
                const Spacer(),
              const Text(
                'Submit',
                style: TextStyle(
                  fontSize: 15,
                  color: kwhite,
                ),
              ),
              if (Provider.of<RegisterProvider>(context).isRegLoading)
                const Spacer(),
              if (Provider.of<RegisterProvider>(context).isRegLoading)
                SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    backgroundColor: lightOrange,
                    valueColor: const AlwaysStoppedAnimation<Color>(kwhite),
                  ),
                )
            ],
          ),
        ),
        // CustomButton1(
        //   onTap: () {
        //     if (_globalKey.currentState!.validate()) {}
        //   },
        //   text: 'Submit',
        //   height: 55,
        //   textsize: 15,
        // ),
      ),
      backgroundColor: kwhite,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: kwhite,
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   color: kblack,
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: const Icon(Icons.arrow_back_ios),
        // ),
        centerTitle: true,
        title: const Text(
          "Partner Registration",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: kblack,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: globalKey,
            child: Consumer<RegisterProvider>(builder: (context, regiModel, _) {
              return Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Complete the registration process to serve as a partner person on this platform",
                    style: TextStyle(
                      fontSize: 12,
                      color: kblack,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    value: 0.66,
                    minHeight: 3,
                    color: lightOrange,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (regiModel.deliverymanimage != null)
                    Stack(
                      children: [
                        Container(
                          width: ResponsiveRatio().width(context, 0.15),
                          height: ResponsiveRatio().width(context, 0.15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: FileImage(regiModel.deliverymanimage!),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: InkWell(
                            onTap: () {
                              regiModel.removedeliverymanimage();
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: kwhite),
                              child: const Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: kwhite,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                titlePadding: EdgeInsets.zero,
                                title: Column(
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                      "Select Profile Picture",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: () async {
                                              await regiModel
                                                  .pickdeliverymanImage(
                                                      ImageSource.gallery);
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(15),
                                                ),
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  "GALLARY",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () async {
                                              await regiModel
                                                  .pickdeliverymanImage(
                                                      ImageSource.camera);
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: kblack,
                                                borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(15),
                                                ),
                                              ),
                                              alignment: Alignment.center,
                                              child: const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  "CAMERA",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: kwhite,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                      child: SizedBox(
                        width: ResponsiveRatio().width(context, 0.15),
                        height: ResponsiveRatio().width(context, 0.15),
                        child: DottedBorder(
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 3],
                          color: lightOrange,
                          borderType: BorderType.RRect,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt_rounded,
                                    size: 35,
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    "Upload photo",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      // Expanded(
                      //   child: DropdownButtonHideUnderline(
                      //     child: DropdownButton2<String>(
                      //       hint: const Text(
                      //         'Select type',
                      //         style: TextStyle(
                      //           fontSize: 12,
                      //           fontWeight: FontWeight.w500,
                      //           color: Colors.black,
                      //         ),
                      //       ),
                      //       items: deliverytype
                      //           .map((String item) => DropdownMenuItem<String>(
                      //                 value: item,
                      //                 child: Text(
                      //                   item,
                      //                   style: const TextStyle(
                      //                     fontSize: 12,
                      //                     fontWeight: FontWeight.w500,
                      //                   ),
                      //                 ),
                      //               ))
                      //           .toList(),
                      //       value: deliverytext,
                      //       onChanged: (String? value) {
                      //         setState(() {
                      //           deliverytext = value;
                      //           // seletedType = value ?? '';
                      //         });
                      //       },
                      //       buttonStyleData: ButtonStyleData(
                      //         height: 50,
                      //         padding: const EdgeInsets.only(left: 5, right: 5),
                      //         decoration: BoxDecoration(
                      //           color: Colors.grey.shade100,
                      //           borderRadius: BorderRadius.circular(10),
                      //           border: Border.all(
                      //             color: lightOrange,
                      //           ),
                      //         ),
                      //       ),
                      //       iconStyleData: const IconStyleData(
                      //         icon: Icon(
                      //           Icons.arrow_drop_down,
                      //         ),
                      //         iconSize: 25,
                      //       ),
                      //       dropdownStyleData: DropdownStyleData(
                      //         maxHeight: 200,
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(10),
                      //         ),
                      //         offset: const Offset(0, -6),
                      //         scrollbarTheme: ScrollbarThemeData(
                      //           radius: const Radius.circular(40),
                      //           thickness: MaterialStateProperty.all<double>(6),
                      //           thumbVisibility:
                      //               MaterialStateProperty.all<bool>(true),
                      //         ),
                      //       ),
                      //       menuItemStyleData: const MenuItemStyleData(
                      //         height: 40,
                      //         padding: EdgeInsets.only(left: 10, right: 10),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            items: ConstData.overtheworld
                                .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: regiModel.worldtext,
                            onChanged: (String? value) {
                              regiModel.setWrold(value);
                            },
                            style: const TextStyle(
                              color: kblack,
                            ),
                            buttonStyleData: ButtonStyleData(
                              height: 50,
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: lightOrange,
                                ),
                              ),
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: kblack,
                              ),
                              iconSize: 25,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              offset: const Offset(0, -6),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all<double>(6),
                                thumbVisibility:
                                    MaterialStateProperty.all<bool>(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 10, right: 10),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  // if (regiModel.selectedPartnerType == 'Freelancer' ||
                  //     widget.loginResponse?.partnerType == 'freelancer')
                  //   const SizedBox(
                  //     height: 15,
                  //   ),
                  // if (regiModel.selectedPartnerType == 'Freelancer' ||
                  //     widget.loginResponse?.partnerType == 'freelancer')
                  //   TextFormField(
                  //     style: const TextStyle(
                  //       color: kblack,
                  //     ),
                  //     controller: regiModel.franchiseCode,
                  //     decoration: InputDecoration(
                  //       isDense: true,
                  //       hintText: "Franchise Code",
                  //       hintStyle: const TextStyle(
                  //         color: kblack,
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(color: lightOrange),
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //       enabledBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(color: lightOrange),
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //     ),
                  //   ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    style: const TextStyle(
                      color: kblack,
                    ),
                    controller: regiModel.nationalitycontroller,
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: kwhite,
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(8),
                          ),
                        ),
                        builder: (context) {
                          return countrySelection();
                        },
                      );
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: "Nationality",
                      hintStyle: const TextStyle(
                        color: kblack,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: lightOrange),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: lightOrange),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      items: ConstData.passportfield
                          .map(
                            (String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      value: regiModel.passporttext,
                      onChanged: (String? value) {
                        regiModel.setIdType(value);
                      },
                      style: const TextStyle(
                        color: kblack,
                      ),
                      buttonStyleData: ButtonStyleData(
                        height: 50,
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: lightOrange,
                          ),
                        ),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: kblack,
                        ),
                        iconSize: 25,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        offset: const Offset(0, -6),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all<double>(6),
                          thumbVisibility:
                              MaterialStateProperty.all<bool>(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.only(left: 10, right: 10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    style: const TextStyle(
                      color: kblack,
                    ),
                    cursorColor: lightOrange,
                    // keyboardType: TextInputType.number,
                    controller: regiModel.proofIdNoController,
                    decoration: InputDecoration(
                      hintText: "Eg: XXXXX-XXXXXXX-X",
                      isDense: true,
                      hintStyle: const TextStyle(
                        color: kblack,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: lightOrange.withOpacity(0.4)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: lightOrange, width: 2)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (val) {
                      if (regiModel.passporttext == 'Passport') {
                        return regiModel.validatePassport(val ?? '');
                      } else {
                        return regiModel.validateNationalID(val ?? '');
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      regiModel.proofIdFrontImage != null
                          ? Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: FileImage(
                                              regiModel.proofIdFrontImage!),
                                          fit: BoxFit.fill),
                                    ),
                                    height: 100,
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    right: 10,
                                    child: InkWell(
                                      onTap: () {
                                        regiModel.removeImage(
                                          type: 'passport-front',
                                        );
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kwhite),
                                        child: const Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Icon(
                                            Icons.delete_outline,
                                            color: Colors.red,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Expanded(
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: kwhite,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          titlePadding: EdgeInsets.zero,
                                          title: Column(
                                            children: [
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              const Text(
                                                "Select Profile Picture",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () async {
                                                        regiModel.pickImage(
                                                            ImageSource.gallery,
                                                            type:
                                                                'passport-front');
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.grey
                                                              .withOpacity(0.2),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    15),
                                                          ),
                                                        ),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Text(
                                                            "GALLARY",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await regiModel.pickImage(
                                                            ImageSource.camera,
                                                            type:
                                                                'passport-front');
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: kblack,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    15),
                                                          ),
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Text(
                                                            "CAMERA",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: kwhite,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 100,
                                  child: DottedBorder(
                                      radius: const Radius.circular(10),
                                      dashPattern: const [10, 3],
                                      color: lightOrange,
                                      borderType: BorderType.RRect,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.camera_alt_rounded,
                                              size: 35,
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                            ),
                                            Text(
                                              "Front Image",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                            ),
                      const SizedBox(
                        width: 10,
                      ),
                      regiModel.proofIdBackImage != null
                          ? Expanded(
                              child: Stack(children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image:
                                        FileImage(regiModel.proofIdBackImage!),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                height: 100,
                              ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: InkWell(
                                  onTap: () {
                                    regiModel.removeImage(
                                        type: 'passport-back');
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle, color: kwhite),
                                    child: const Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(
                                        Icons.delete_outline,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]))
                          : Expanded(
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: kwhite,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          titlePadding: EdgeInsets.zero,
                                          title: Column(
                                            children: [
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              const Text(
                                                "Select Profile Picture",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await regiModel.pickImage(
                                                            ImageSource.gallery,
                                                            type:
                                                                'passport-back');
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        decoration: BoxDecoration(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.2),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            15))),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Text(
                                                            "GALLARY",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await regiModel.pickImage(
                                                            ImageSource.camera,
                                                            type:
                                                                'passport-back');
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: kblack,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    15),
                                                          ),
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Text(
                                                            "CAMERA",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: kwhite,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 100,
                                  child: DottedBorder(
                                    radius: const Radius.circular(10),
                                    dashPattern: const [10, 3],
                                    color: lightOrange,
                                    borderType: BorderType.RRect,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.camera_alt_rounded,
                                            size: 35,
                                            color:
                                                Colors.black.withOpacity(0.6),
                                          ),
                                          Text(
                                            "Back Image",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    style: const TextStyle(
                      color: kblack,
                    ),
                    cursorColor: lightOrange,
                    keyboardType: TextInputType.number,
                    controller: regiModel.ageController,
                    decoration: InputDecoration(
                      hintText: "Enter Age",
                      hintStyle: const TextStyle(
                        color: kblack,
                      ),
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: lightOrange.withOpacity(0.4)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: lightOrange, width: 2),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "* Age Required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    style: const TextStyle(
                      color: kblack,
                    ),
                    controller: regiModel.dataOfBrithController,
                    readOnly: true,
                    onTap: () {
                      regiModel.startdate(context);
                    },
                    decoration: InputDecoration(
                      hintText: "Date of Birth",
                      hintStyle: const TextStyle(
                        color: kblack,
                      ),
                      suffixIcon: GestureDetector(
                        // onTap: () {
                        //   _startdate(context);
                        // },
                        child: const Icon(Icons.calendar_month, size: 25),
                      ),
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: lightOrange.withOpacity(0.6)),
                      ),
                      suffixIconColor: MaterialStateColor.resolveWith(
                          (states) => states.contains(MaterialState.focused)
                              ? lightOrange
                              : Colors.black.withOpacity(0.8)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: lightOrange, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "* Date of Birth Required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Driving license",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: kblack,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      regiModel.frontlicenseimage != null
                          ? Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: FileImage(
                                            regiModel.frontlicenseimage!),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    height: 100,
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    right: 10,
                                    child: InkWell(
                                      onTap: () {
                                        regiModel.removeImage(
                                          type: 'license-front',
                                        );
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kwhite),
                                        child: const Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Icon(
                                            Icons.delete_outline,
                                            color: Colors.red,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Expanded(
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: kwhite,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          titlePadding: EdgeInsets.zero,
                                          title: Column(
                                            children: [
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              const Text(
                                                "Select Profile Picture",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await regiModel
                                                            .pickImage(
                                                          ImageSource.gallery,
                                                          type: 'license-front',
                                                        );
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.grey
                                                              .withOpacity(0.2),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    15),
                                                          ),
                                                        ),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Text(
                                                            "GALLARY",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await regiModel
                                                            .pickImage(
                                                          ImageSource.camera,
                                                          type: 'license-front',
                                                        );
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: kblack,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    15),
                                                          ),
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Text(
                                                            "CAMERA",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: kwhite,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 100,
                                  child: DottedBorder(
                                    radius: const Radius.circular(10),
                                    dashPattern: const [10, 3],
                                    color: lightOrange,
                                    borderType: BorderType.RRect,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.camera_alt_rounded,
                                            size: 35,
                                            color:
                                                Colors.black.withOpacity(0.6),
                                          ),
                                          Text(
                                            "Front Image",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      const SizedBox(
                        width: 10,
                      ),
                      regiModel.backlicenseimage != null
                          ? Expanded(
                              child: Stack(children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: FileImage(
                                          regiModel.backlicenseimage!),
                                      fit: BoxFit.fill),
                                ),
                                height: 100,
                              ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: InkWell(
                                  onTap: () {
                                    regiModel.removeImage(type: 'license-back');
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle, color: kwhite),
                                    child: const Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(
                                        Icons.delete_outline,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]))
                          : Expanded(
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: kwhite,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          titlePadding: EdgeInsets.zero,
                                          title: Column(
                                            children: [
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              const Text(
                                                "Select Profile Picture",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await regiModel
                                                            .pickImage(
                                                          ImageSource.gallery,
                                                          type: 'license-back',
                                                        );
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.grey
                                                              .withOpacity(0.2),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    15),
                                                          ),
                                                        ),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Text(
                                                            "GALLARY",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await regiModel
                                                            .pickImage(
                                                          ImageSource.camera,
                                                          type: 'license-back',
                                                        );
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: kblack,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    15),
                                                          ),
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Text(
                                                            "CAMERA",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: kwhite,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 100,
                                  child: DottedBorder(
                                    radius: const Radius.circular(10),
                                    dashPattern: const [10, 3],
                                    color: lightOrange,
                                    borderType: BorderType.RRect,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.camera_alt_rounded,
                                            size: 35,
                                            color:
                                                Colors.black.withOpacity(0.6),
                                          ),
                                          Text(
                                            "Back Image",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  // _showdialogbox(String mssg) {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           content: Text(
  //             mssg,
  //           ),
  //           actions: [
  //             Row(
  //               children: [
  //                 ElevatedButton(
  //                     style: ElevatedButton.styleFrom(primary: kblack),
  //                     onPressed: () {
  //                       Navigator.pop(context);
  //                     },
  //                     child: const Text(
  //                       "Cancel",
  //                       style: TextStyle(
  //                         color: kwhite,
  //                       ),
  //                     )),
  //                 const SizedBox(
  //                   width: 10,
  //                 ),
  //                 ElevatedButton(
  //                   style: ElevatedButton.styleFrom(primary: kblack),
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },
  //                   child: const Text(
  //                     "Ok",
  //                     style: TextStyle(
  //                       color: kwhite,
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             )
  //           ],
  //         );
  //       });
  // }

  Widget countrySelection() {
    return StatefulBuilder(builder: (context, setStates) {
      return
          // Consumer<UserAddressProvider>(builder: (context, model, child) {
          // return
          Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: searchController,
                  readOnly: false,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    fillColor: kwhite,
                    hintText: 'Search Country',
                  ),
                  // hintFontSize: 12,
                  onChanged: (val) {
                    // _debouncer.run(() {
                    final result = ConstData.countries
                        .where(
                          (e) => e['name']!
                              .toLowerCase()
                              .contains(val.trim().toLowerCase()),
                        )
                        .toList();
                    setStates(() {
                      searchResult = result;
                    });

                    // });
                  },
                ),
              ),
              if (searchResult?.isEmpty ?? false)
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'asset/png/locationnotfound.png',
                          height: 100,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'No Result found',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: searchResult != null
                        ? searchResult!.length
                        : ConstData.countries.length,
                    itemBuilder: (BuildContext context, int index) {
                      final data = searchResult != null
                          ? searchResult![index]
                          : ConstData.countries[index];
                      return RadioListTile.adaptive(
                        value: data['name'],
                        groupValue: selectnatinality,
                        title: Text(
                          '${data['name']}',
                        ),
                        onChanged: (value) {
                          setStates(() {
                            selectnatinality = data['name'];
                            Provider.of<RegisterProvider>(context,
                                    listen: false)
                                .setNatinality(selectnatinality);
                          });
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
          Positioned(
            top: -70,
            right: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const CircleAvatar(
                radius: 25,
                backgroundColor: kwhite,
                child: Icon(
                  Icons.clear,
                  color: kblack,
                ),
              ),
            ),
          )
        ],
      );
      // });
    });
  }
}
