import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/config.dart';
import 'package:salesapp/model/profile_model/profile_model.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

import '../../constant/colors/colors.dart';
import '../../constant/const_data.dart';
import '../../constant/responsive.dart';
import '../../provider/auth_provider/register_provider.dart';
import '../../provider/theme_provider.dart';
import '../../utils/country_phone_field/intl_phone_field.dart';
import '../../utils/language/local_storage.dart';

// ignore: must_be_immutable
class ProfileEditingPage extends StatefulWidget {
  ProfileEditingPage({super.key, required this.profileModel});

  ProfileModel profileModel;

  @override
  State<ProfileEditingPage> createState() => _ProfileEditingPageState();
}

class _ProfileEditingPageState extends State<ProfileEditingPage> {
  // String? selectnatinality;

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  final TextEditingController searchController = TextEditingController();

  List<Map<String, String>>? searchResult;

  int randomKey = 0;
  @override
  void initState() {
    super.initState();
    randomKey = Random().nextInt(1000);
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(lightOrange),
          ),
          onPressed: () {
            if (globalKey.currentState!.validate()) {
              Provider.of<RegisterProvider>(context, listen: false)
                  .checkIsEditOrNot(
                widget.profileModel,
                context,
              );
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // if (Provider.of<RegisterProvider>(context, listen: false)
              //     .isLoading)
              //   const Spacer(),
              Text(
                tr(context).submit,
                style: const TextStyle(fontSize: 15),
              ),
              // if (Provider.of<RegisterProvider>(context, listen: false)
              //     .isLoading)
              //   const Spacer(),
              // if (Provider.of<RegisterProvider>(context, listen: false)
              //     .isLoading)
              //   SizedBox(
              //     height: 20,
              //     width: 20,
              //     child: CircularProgressIndicator(
              //       strokeWidth: 2,
              //       backgroundColor: lightOrange,
              //       valueColor: const AlwaysStoppedAnimation<Color>(kwhite),
              //     ),
              //   )
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
      // backgroundColor: kwhite,
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            // color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          tr(context).edit_profile,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ProgressHUD(
        key: UniqueKey(),
        inAsyncCall: Provider.of<RegisterProvider>(context).isLoading,
        opacity: 0.3,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: globalKey,
              child: Consumer<RegisterProvider>(
                builder: (context, regiModel, _) {
                  final data = widget.profileModel;
                  return Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (regiModel.deliverymanimage != null ||
                          widget.profileModel.profilePic != null)
                        Stack(
                          children: [
                            if (regiModel.deliverymanimage != null)
                              Container(
                                width: ResponsiveRatio().width(context, 0.15),
                                height: ResponsiveRatio().width(context, 0.15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: FileImage(
                                          regiModel.deliverymanimage!),
                                      fit: BoxFit.fill),
                                ),
                              )
                            else
                              // Image.network(
                              //   "${Config.imageURL + (data.profilePic ?? '')}?ip=$randomKey",
                              //   errorBuilder: (context, error, stackTrace) =>
                              //       const Icon(
                              //     Icons.person,
                              //     size: 60,
                              //     color: Colors.grey,
                              //   ),
                              //   loadingBuilder:
                              //       (context, child, loadingProgress) =>
                              //           Utils.photoShimmer(100, 100),
                              // ),
                              CachedNetworkImage(
                                imageUrl:
                                    "${Config.imgkitUrl + (data.profilePic ?? '')}?tr=w-350&ip=$randomKey",
                                placeholder: (context, url) => SizedBox(
                                  width: ResponsiveRatio().width(context, 0.15),
                                  height:
                                      ResponsiveRatio().width(context, 0.15),
                                  child: const Center(
                                      child:
                                          CircularProgressIndicator.adaptive()),
                                ),
                                errorWidget: (context, url, error) {
                                  return const Icon(Icons.error);
                                },
                                imageBuilder: (context, imageProvider) {
                                  CachedNetworkImage.evictFromCache(
                                      "${Config.imgkitUrl + (data.profilePic ?? '')}?tr=w-350");
                                  return Container(
                                    width:
                                        ResponsiveRatio().width(context, 0.15),
                                    height:
                                        ResponsiveRatio().width(context, 0.15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.grey.shade400),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: InkWell(
                                onTap: () {
                                  regiModel.removedeliverymanimage();
                                  if (widget.profileModel.profilePic != null) {
                                    setState(() {
                                      widget.profileModel = widget.profileModel
                                          .copyWith(profilePic: null);
                                    });
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kwhite,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        blurRadius: 3,
                                        offset: const Offset(0, 0.75),
                                      ),
                                    ],
                                  ),
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
                                    // backgroundColor: kwhite,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
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
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      "GALLARY",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: kblack,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomRight:
                                                          Radius.circular(15),
                                                    ),
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      "CAMERA",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                        color:
                                            themeChange.theme == ThemeMode.light
                                                ? Colors.black.withOpacity(0.6)
                                                : kwhite,
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        "Upload photo",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: themeChange.theme ==
                                                  ThemeMode.light
                                              ? Colors.black.withOpacity(0.6)
                                              : kwhite,
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
                      TextFormField(
                        // readOnly: franModel.isEdit,
                        cursorColor: lightOrange,
                        controller: regiModel.firstName,

                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Enter name',
                          // fillColor: kwhite,
                          // filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: lightOrange.withOpacity(0.4)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: lightOrange, width: 2),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: kred),
                          ),
                          prefixIcon: const Icon(
                            Icons.person,
                            size: 20,
                          ),
                          // prefixIconColor: MaterialStateColor.resolveWith(
                          //   (states) => states.contains(MaterialState.focused)
                          //       ? lightOrange
                          //       : Colors.black.withOpacity(0.5),
                          // ),
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "* Name Required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      IntlPhoneField(
                        controller: regiModel.phoneNumber,
                        decoration: InputDecoration(
                          isDense: true,
                          counterText: "",
                          hintText: "Enter your phone number",
                          hintStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: lightOrange.withOpacity(0.4),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: lightOrange, width: 2),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: kred),
                          ),
                        ),
                        initialCountryCode: regiModel.countryCode ?? 'AE',
                        // initialCountryCode: "+971",
                        languageCode: "en",
                        onChanged: (phone) {},
                        onCountryChanged: (country) {
                          regiModel.setCountryCode(country.dialCode);
                        },
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
                                    .map(
                                      (String item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                value: regiModel.worldtext,
                                onChanged: (String? value) {
                                  regiModel.setWrold(value);
                                },
                                buttonStyleData: ButtonStyleData(
                                  height: 50,
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  decoration: BoxDecoration(
                                    color: themeChange.theme == ThemeMode.light
                                        ? Colors.grey.shade100
                                        : Colors.grey.shade900,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: lightOrange,
                                    ),
                                  ),
                                ),
                                iconStyleData: const IconStyleData(
                                  icon: Icon(
                                    Icons.arrow_drop_down,
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
                                    thickness:
                                        MaterialStateProperty.all<double>(6),
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
                      if (regiModel.selectedPartnerType == 'Freelancer')
                        const SizedBox(
                          height: 15,
                        ),
                      if (regiModel.selectedPartnerType == 'Freelancer')
                        TextFormField(
                          controller: regiModel.franchiseCode,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "Franchise Code",
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
                      TextFormField(
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
                          buttonStyleData: ButtonStyleData(
                            height: 50,
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            decoration: BoxDecoration(
                              color: themeChange.theme == ThemeMode.light
                                  ? Colors.grey.shade100
                                  : Colors.grey.shade900,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: lightOrange,
                              ),
                            ),
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.arrow_drop_down,
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
                        cursorColor: lightOrange,
                        // keyboardType: TextInputType.number,
                        controller: regiModel.proofIdNoController,
                        decoration: InputDecoration(
                          hintText: "Eg: XXXXX-XXXXXXX-X",
                          isDense: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: lightOrange.withOpacity(0.4)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: lightOrange, width: 2)),
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
                          regiModel.proofIdFrontImage != null ||
                                  data.proofIDFrontImage != null
                              ? Expanded(
                                  child: Stack(
                                    children: [
                                      if (regiModel.proofIdFrontImage != null)
                                        Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade300,
                                                blurRadius: 3,
                                                offset: const Offset(0, 0.75),
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: FileImage(
                                                regiModel.proofIdFrontImage!,
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          height:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                        )
                                      else
                                        CachedNetworkImage(
                                            imageUrl:
                                                "${Config.imgkitUrl + (data.proofIDFrontImage ?? '')}?tr=w-350&ip=$randomKey",
                                            placeholder: (context, url) =>
                                                SizedBox(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.4,
                                                  child: const Center(
                                                    child:
                                                        CircularProgressIndicator
                                                            .adaptive(),
                                                  ),
                                                ),
                                            imageBuilder:
                                                (context, imageProvider) {
                                              CachedNetworkImage.evictFromCache(
                                                  Config.imgkitUrl +
                                                      (data.proofIDFrontImage ??
                                                          ''));
                                              return Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.4,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:
                                                          Colors.grey.shade300,
                                                      blurRadius: 3,
                                                      offset:
                                                          const Offset(0, 0.75),
                                                    ),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              );
                                            }),
                                      Positioned(
                                        bottom: 10,
                                        right: 10,
                                        child: InkWell(
                                          onTap: () {
                                            regiModel.removeImage(
                                              type: 'passport-front',
                                            );
                                            if (widget
                                                    .profileModel.profilePic !=
                                                null) {
                                              setState(() {
                                                widget.profileModel = widget
                                                    .profileModel
                                                    .copyWith(
                                                        proofIDFrontImage:
                                                            null);
                                              });
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kwhite,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.shade300,
                                                  blurRadius: 3,
                                                  offset: const Offset(0, 0.75),
                                                ),
                                              ],
                                            ),
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
                                            // backgroundColor: kwhite,
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
                                                          regiModel.pickImage(
                                                              ImageSource
                                                                  .gallery,
                                                              type:
                                                                  'passport-front');
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.2),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(15),
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
                                                              ImageSource
                                                                  .camera,
                                                              type:
                                                                  'passport-front');
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: kblack,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
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
                                        },
                                      );
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
                                                color: themeChange.theme ==
                                                        ThemeMode.light
                                                    ? Colors.black
                                                        .withOpacity(0.6)
                                                    : kwhite,
                                              ),
                                              Text(
                                                "Front Image",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: themeChange.theme ==
                                                          ThemeMode.light
                                                      ? Colors.black
                                                          .withOpacity(0.6)
                                                      : kwhite,
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
                          regiModel.proofIdBackImage != null ||
                                  data.proofIDBackImage != null
                              ? Expanded(
                                  child: Stack(
                                    children: [
                                      if (regiModel.proofIdBackImage != null)
                                        Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade300,
                                                blurRadius: 3,
                                                offset: const Offset(0, 0.75),
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: FileImage(
                                                regiModel.proofIdBackImage!,
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          height:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                        )
                                      else
                                        CachedNetworkImage(
                                            imageUrl:
                                                "${Config.imgkitUrl + (data.proofIDBackImage ?? '')}?tr=w-350&ip=$randomKey",
                                            placeholder: (context, url) =>
                                                SizedBox(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.4,
                                                  child: const Center(
                                                    child:
                                                        CircularProgressIndicator
                                                            .adaptive(),
                                                  ),
                                                ),
                                            imageBuilder:
                                                (context, imageProvider) {
                                              CachedNetworkImage.evictFromCache(
                                                  Config.imgkitUrl +
                                                      (data.proofIDBackImage ??
                                                          ''));
                                              return Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.4,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:
                                                          Colors.grey.shade300,
                                                      blurRadius: 3,
                                                      offset:
                                                          const Offset(0, 0.75),
                                                    ),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              );
                                            }),
                                      Positioned(
                                        bottom: 10,
                                        right: 10,
                                        child: InkWell(
                                          onTap: () {
                                            regiModel.removeImage(
                                                type: 'passport-back');
                                            if (widget.profileModel
                                                    .proofIDBackImage !=
                                                null) {
                                              setState(() {
                                                widget.profileModel = widget
                                                    .profileModel
                                                    .copyWith(
                                                        proofIDBackImage: null);
                                              });
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kwhite,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.shade300,
                                                  blurRadius: 3,
                                                  offset: const Offset(0, 0.75),
                                                ),
                                              ],
                                            ),
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
                                              // backgroundColor: kwhite,
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
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                                                    ImageSource
                                                                        .gallery,
                                                                    type:
                                                                        'passport-back');
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.2),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        15),
                                                              ),
                                                            ),
                                                            child:
                                                                const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                "GALLARY",
                                                                style:
                                                                    TextStyle(
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
                                                                    ImageSource
                                                                        .camera,
                                                                    type:
                                                                        'passport-back');
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: kblack,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            15),
                                                              ),
                                                            ),
                                                            alignment: Alignment
                                                                .center,
                                                            child:
                                                                const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                "CAMERA",
                                                                style:
                                                                    TextStyle(
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
                                                color: themeChange.theme ==
                                                        ThemeMode.light
                                                    ? Colors.black
                                                        .withOpacity(0.6)
                                                    : kwhite,
                                              ),
                                              Text(
                                                "Back Image",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: themeChange.theme ==
                                                          ThemeMode.light
                                                      ? Colors.black
                                                          .withOpacity(0.6)
                                                      : kwhite,
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
                        cursorColor: lightOrange,
                        keyboardType: TextInputType.number,
                        controller: regiModel.ageController,
                        decoration: InputDecoration(
                          hintText: "Enter Age",
                          isDense: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: lightOrange.withOpacity(0.4)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: lightOrange, width: 2),
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
                        controller: regiModel.dataOfBrithController,
                        readOnly: true,
                        onTap: () {
                          regiModel.startdate(context);
                        },
                        decoration: InputDecoration(
                          hintText: "Date of Birth",
                          suffixIcon: GestureDetector(
                            // onTap: () {
                            //   _startdate(context);
                            // },
                            child: const Icon(Icons.calendar_month, size: 25),
                          ),
                          isDense: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: lightOrange.withOpacity(0.6),
                            ),
                          ),
                          suffixIconColor: MaterialStateColor.resolveWith(
                              (states) => states.contains(MaterialState.focused)
                                  ? lightOrange
                                  : themeChange.theme == ThemeMode.light
                                      ? Colors.black.withOpacity(0.8)
                                      : Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: lightOrange, width: 2),
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
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          regiModel.frontlicenseimage != null ||
                                  data.drivingLicenseFrontImage != null
                              ? Expanded(
                                  child: Stack(
                                    children: [
                                      if (regiModel.frontlicenseimage != null)
                                        Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade300,
                                                blurRadius: 3,
                                                offset: const Offset(0, 0.75),
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: FileImage(
                                                  regiModel.frontlicenseimage!),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          height:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                        )
                                      else
                                        CachedNetworkImage(
                                            imageUrl:
                                                "${Config.imgkitUrl + (data.drivingLicenseFrontImage ?? '')}?tr=w-350&ip=$randomKey",
                                            placeholder: (context, url) =>
                                                SizedBox(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.4,
                                                  child: const Center(
                                                    child:
                                                        CircularProgressIndicator
                                                            .adaptive(),
                                                  ),
                                                ),
                                            imageBuilder:
                                                (context, imageProvider) {
                                              CachedNetworkImage.evictFromCache(
                                                  Config.imgkitUrl +
                                                      (data.drivingLicenseFrontImage ??
                                                          ''));
                                              return Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.4,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:
                                                          Colors.grey.shade300,
                                                      blurRadius: 3,
                                                      offset:
                                                          const Offset(0, 0.75),
                                                    ),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              );
                                            }),
                                      Positioned(
                                        bottom: 10,
                                        right: 10,
                                        child: InkWell(
                                          onTap: () {
                                            regiModel.removeImage(
                                              type: 'license-front',
                                            );
                                            if (widget.profileModel
                                                    .drivingLicenseFrontImage !=
                                                null) {
                                              setState(() {
                                                widget.profileModel = widget
                                                    .profileModel
                                                    .copyWith(
                                                        drivingLicenseFrontImage:
                                                            null);
                                              });
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kwhite,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.shade300,
                                                  blurRadius: 3,
                                                  offset: const Offset(0, 0.75),
                                                ),
                                              ],
                                            ),
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
                                            // backgroundColor: kwhite,
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
                                                            type:
                                                                'license-front',
                                                          );
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.2),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(15),
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
                                                            type:
                                                                'license-front',
                                                          );
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: kblack,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
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
                                        },
                                      );
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
                                                color: themeChange.theme ==
                                                        ThemeMode.light
                                                    ? Colors.black
                                                        .withOpacity(0.6)
                                                    : kwhite,
                                              ),
                                              Text(
                                                "Front Image",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: themeChange.theme ==
                                                          ThemeMode.light
                                                      ? Colors.black
                                                          .withOpacity(0.6)
                                                      : kwhite,
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
                          regiModel.backlicenseimage != null ||
                                  data.drivingLicenseBackImage != null
                              ? Expanded(
                                  child: Stack(
                                    children: [
                                      if (regiModel.backlicenseimage != null)
                                        Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade300,
                                                blurRadius: 3,
                                                offset: const Offset(0, 0.75),
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: FileImage(regiModel
                                                    .backlicenseimage!),
                                                fit: BoxFit.fill),
                                          ),
                                          height:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                        )
                                      else
                                        CachedNetworkImage(
                                          // cacheKey:
                                          //     '${(data.drivingLicenseBackImage ?? '')}${DateTime.now()}',
                                          imageUrl:
                                              "${Config.imgkitUrl + (data.drivingLicenseBackImage ?? '')}?tr=w-350&ip=$randomKey",
                                          placeholder: (context, url) =>
                                              SizedBox(
                                            height: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.4,
                                            child: const Center(
                                              child: CircularProgressIndicator
                                                  .adaptive(),
                                            ),
                                          ),

                                          imageBuilder:
                                              (context, imageProvider) {
                                            CachedNetworkImage.evictFromCache(
                                                Config.imgkitUrl +
                                                    (data.drivingLicenseBackImage ??
                                                        ''));
                                            return Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.4,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.shade300,
                                                    blurRadius: 3,
                                                    offset:
                                                        const Offset(0, 0.75),
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      Positioned(
                                        bottom: 10,
                                        right: 10,
                                        child: InkWell(
                                          onTap: () {
                                            regiModel.removeImage(
                                                type: 'license-back');
                                            if (widget.profileModel
                                                    .drivingLicenseBackImage !=
                                                null) {
                                              setState(() {
                                                widget.profileModel = widget
                                                    .profileModel
                                                    .copyWith(
                                                        drivingLicenseBackImage:
                                                            null);
                                              });
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kwhite,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.shade300,
                                                  blurRadius: 3,
                                                  offset: const Offset(0, 0.75),
                                                ),
                                              ],
                                            ),
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
                                            // backgroundColor: kwhite,
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
                                                            type:
                                                                'license-back',
                                                          );
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.2),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(15),
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
                                                            type:
                                                                'license-back',
                                                          );
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: kblack,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
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
                                        },
                                      );
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
                                                color: themeChange.theme ==
                                                        ThemeMode.light
                                                    ? Colors.black
                                                        .withOpacity(0.6)
                                                    : kwhite,
                                              ),
                                              Text(
                                                "Back Image",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: themeChange.theme ==
                                                          ThemeMode.light
                                                      ? Colors.black
                                                          .withOpacity(0.6)
                                                      : kwhite,
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
                },
              ),
            ),
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
                        groupValue: Provider.of<RegisterProvider>(context)
                            .nationalitycontroller
                            .text,
                        title: Text(
                          '${data['name']}',
                        ),
                        onChanged: (value) {
                          // setStates(() {
                          // selectnatinality = data['name'];
                          Provider.of<RegisterProvider>(context, listen: false)
                              .setNatinality(value);
                          // });
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
