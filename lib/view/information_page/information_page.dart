import 'dart:math';
import 'dart:developer' as ls;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/config.dart';
import 'package:salesapp/constant/colors/colors.dart';
import 'package:salesapp/constant/size/size.dart';
import 'package:salesapp/provider/franchise_member_provider/franchise_member_provider.dart';
import 'package:salesapp/utils/utils.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

import '../../common_widget/custom_poppins.dart';
import '../../model/franchise_member_model/franchise_member_model.dart';
import '../../provider/theme_provider.dart';
import '../../responsive.dart';
import '../../utils/country_phone_field/intl_phone_field.dart';

class InformationPage extends StatefulWidget {
  final FranchiseMemberModel model;

  const InformationPage({
    super.key,
    required this.model,
  });

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  String? selectnatinality;

  final TextEditingController searchController = TextEditingController();

  List<Map<String, String>>? searchResult;

  String? deliverytext;

  String? selectvehicletext;

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  static List<String> overtheworld = [
    "UAE",
    "All over the world",
  ];
  int? randomKey, a, b, c, d, e;

  @override
  void initState() {
    super.initState();
    randomKey = Random().nextInt(1000);
    a = Random().nextInt(1000);
    b = Random().nextInt(1000);
    c = Random().nextInt(1000);
    d = Random().nextInt(1000);
    e = Random().nextInt(1000);
  }

  static List<Map<String, String>> countries = [
    {'id': 'AF', 'name': 'Afghanistan'},
    {'id': 'AL', 'name': 'Albania'},
    {'id': 'DZ', 'name': 'Algeria'},
    {'id': 'AD', 'name': 'Andorra'},
    {'id': 'AO', 'name': 'Angola'},
    {'id': 'AG', 'name': 'Antigua and Barbuda'},
    {'id': 'AR', 'name': 'Argentina'},
    {'id': 'AM', 'name': 'Armenia'},
    {'id': 'AU', 'name': 'Australia'},
    {'id': 'AT', 'name': 'Austria'},
    {'id': 'AZ', 'name': 'Azerbaijan'},
    {'id': 'BS', 'name': 'Bahamas'},
    {'id': 'BH', 'name': 'Bahrain'},
    {'id': 'BD', 'name': 'Bangladesh'},
    {'id': 'BB', 'name': 'Barbados'},
    {'id': 'BY', 'name': 'Belarus'},
    {'id': 'BE', 'name': 'Belgium'},
    {'id': 'BZ', 'name': 'Belize'},
    {'id': 'BJ', 'name': 'Benin'},
    {'id': 'BT', 'name': 'Bhutan'},
    {'id': 'BO', 'name': 'Bolivia'},
    {'id': 'BA', 'name': 'Bosnia and Herzegovina'},
    {'id': 'BW', 'name': 'Botswana'},
    {'id': 'BR', 'name': 'Brazil'},
    {'id': 'BN', 'name': 'Brunei'},
    {'id': 'BG', 'name': 'Bulgaria'},
    {'id': 'BF', 'name': 'Burkina Faso'},
    {'id': 'BI', 'name': 'Burundi'},
    {'id': 'CV', 'name': 'Cabo Verde'},
    {'id': 'KH', 'name': 'Cambodia'},
    {'id': 'CM', 'name': 'Cameroon'},
    {'id': 'CA', 'name': 'Canada'},
    {'id': 'CF', 'name': 'Central African Republic'},
    {'id': 'TD', 'name': 'Chad'},
    {'id': 'CL', 'name': 'Chile'},
    {'id': 'CN', 'name': 'China'},
    {'id': 'CO', 'name': 'Colombia'},
    {'id': 'KM', 'name': 'Comoros'},
    {'id': 'CG', 'name': 'Congo (Congo-Brazzaville)'},
    {'id': 'CR', 'name': 'Costa Rica'},
    {'id': 'HR', 'name': 'Croatia'},
    {'id': 'CU', 'name': 'Cuba'},
    {'id': 'CY', 'name': 'Cyprus'},
    {'id': 'CZ', 'name': 'Czechia (Czech Republic)'},
    {'id': 'CD', 'name': 'Democratic Republic of the Congo'},
    {'id': 'DK', 'name': 'Denmark'},
    {'id': 'DJ', 'name': 'Djibouti'},
    {'id': 'DM', 'name': 'Dominica'},
    {'id': 'DO', 'name': 'Dominican Republic'},
    {'id': 'TL', 'name': 'East Timor (Timor-Leste)'},
    {'id': 'EC', 'name': 'Ecuador'},
    {'id': 'EG', 'name': 'Egypt'},
    {'id': 'SV', 'name': 'El Salvador'},
    {'id': 'GQ', 'name': 'Equatorial Guinea'},
    {'id': 'ER', 'name': 'Eritrea'},
    {'id': 'EE', 'name': 'Estonia'},
    {'id': 'SZ', 'name': 'Eswatini (fmr. "Swaziland")'},
    {'id': 'ET', 'name': 'Ethiopia'},
    {'id': 'FJ', 'name': 'Fiji'},
    {'id': 'FI', 'name': 'Finland'},
    {'id': 'FR', 'name': 'France'},
    {'id': 'GA', 'name': 'Gabon'},
    {'id': 'GM', 'name': 'Gambia'},
    {'id': 'GE', 'name': 'Georgia'},
    {'id': 'DE', 'name': 'Germany'},
    {'id': 'GH', 'name': 'Ghana'},
    {'id': 'GR', 'name': 'Greece'},
    {'id': 'GD', 'name': 'Grenada'},
    {'id': 'GT', 'name': 'Guatemala'},
    {'id': 'GN', 'name': 'Guinea'},
    {'id': 'GW', 'name': 'Guinea-Bissau'},
    {'id': 'GY', 'name': 'Guyana'},
    {'id': 'HT', 'name': 'Haiti'},
    {'id': 'VA', 'name': 'Holy See'},
    {'id': 'HN', 'name': 'Honduras'},
    {'id': 'HU', 'name': 'Hungary'},
    {'id': 'IS', 'name': 'Iceland'},
    {'id': 'IN', 'name': 'India'},
    {'id': 'ID', 'name': 'Indonesia'},
    {'id': 'IR', 'name': 'Iran'},
    {'id': 'IQ', 'name': 'Iraq'},
    {'id': 'IE', 'name': 'Ireland'},
    {'id': 'IL', 'name': 'Israel'},
    {'id': 'IT', 'name': 'Italy'},
    {'id': 'CI', 'name': 'Ivory Coast'},
    {'id': 'JM', 'name': 'Jamaica'},
    {'id': 'JP', 'name': 'Japan'},
    {'id': 'JO', 'name': 'Jordan'},
    {'id': 'KZ', 'name': 'Kazakhstan'},
    {'id': 'KE', 'name': 'Kenya'},
    {'id': 'KI', 'name': 'Kiribati'},
    {'id': 'KW', 'name': 'Kuwait'},
    {'id': 'KG', 'name': 'Kyrgyzstan'},
    {'id': 'LA', 'name': 'Laos'},
    {'id': 'LV', 'name': 'Latvia'},
    {'id': 'LB', 'name': 'Lebanon'},
    {'id': 'LS', 'name': 'Lesotho'},
    {'id': 'LR', 'name': 'Liberia'},
    {'id': 'LY', 'name': 'Libya'},
    {'id': 'LI', 'name': 'Liechtenstein'},
    {'id': 'LT', 'name': 'Lithuania'},
    {'id': 'LU', 'name': 'Luxembourg'},
    {'id': 'MG', 'name': 'Madagascar'},
    {'id': 'MW', 'name': 'Malawi'},
    {'id': 'MY', 'name': 'Malaysia'},
    {'id': 'MV', 'name': 'Maldives'},
    {'id': 'ML', 'name': 'Mali'},
    {'id': 'MT', 'name': 'Malta'},
    {'id': 'MH', 'name': 'Marshall Islands'},
    {'id': 'MR', 'name': 'Mauritania'},
    {'id': 'MU', 'name': 'Mauritius'},
    {'id': 'MX', 'name': 'Mexico'},
    {'id': 'FM', 'name': 'Micronesia'},
    {'id': 'MD', 'name': 'Moldova'},
    {'id': 'MC', 'name': 'Monaco'},
    {'id': 'MN', 'name': 'Mongolia'},
    {'id': 'ME', 'name': 'Montenegro'},
    {'id': 'MA', 'name': 'Morocco'},
    {'id': 'MZ', 'name': 'Mozambique'},
    {'id': 'MM', 'name': 'Myanmar (formerly Burma)'},
    {'id': 'NA', 'name': 'Namibia'},
    {'id': 'NR', 'name': 'Nauru'},
    {'id': 'NP', 'name': 'Nepal'},
    {'id': 'NL', 'name': 'Netherlands'},
    {'id': 'NZ', 'name': 'New Zealand'},
    {'id': 'NI', 'name': 'Nicaragua'},
    {'id': 'NE', 'name': 'Niger'},
    {'id': 'NG', 'name': 'Nigeria'},
    {'id': 'KP', 'name': 'North Korea'},
    {'id': 'MK', 'name': 'North Macedonia (formerly Macedonia)'},
    {'id': 'NO', 'name': 'Norway'},
    {'id': 'OM', 'name': 'Oman'},
    {'id': 'PK', 'name': 'Pakistan'},
    {'id': 'PW', 'name': 'Palau'},
    {'id': 'PS', 'name': 'Palestine State'},
    {'id': 'PA', 'name': 'Panama'},
    {'id': 'PG', 'name': 'Papua New Guinea'},
    {'id': 'PY', 'name': 'Paraguay'},
    {'id': 'PE', 'name': 'Peru'},
    {'id': 'PH', 'name': 'Philippines'},
    {'id': 'PL', 'name': 'Poland'},
    {'id': 'PT', 'name': 'Portugal'},
    {'id': 'QA', 'name': 'Qatar'},
    {'id': 'RO', 'name': 'Romania'},
    {'id': 'RU', 'name': 'Russia'},
    {'id': 'RW', 'name': 'Rwanda'},
    {'id': 'KN', 'name': 'Saint Kitts and Nevis'},
    {'id': 'LC', 'name': 'Saint Lucia'},
    {'id': 'VC', 'name': 'Saint Vincent and the Grenadines'},
    {'id': 'WS', 'name': 'Samoa'},
    {'id': 'SM', 'name': 'San Marino'},
    {'id': 'ST', 'name': 'Sao Tome and Principe'},
    {'id': 'SA', 'name': 'Saudi Arabia'},
    {'id': 'SN', 'name': 'Senegal'},
    {'id': 'RS', 'name': 'Serbia'},
    {'id': 'SC', 'name': 'Seychelles'},
    {'id': 'SL', 'name': 'Sierra Leone'},
    {'id': 'SG', 'name': 'Singapore'},
    {'id': 'SK', 'name': 'Slovakia'},
    {'id': 'SI', 'name': 'Slovenia'},
    {'id': 'SB', 'name': 'Solomon Islands'},
    {'id': 'SO', 'name': 'Somalia'},
    {'id': 'ZA', 'name': 'South Africa'},
    {'id': 'KR', 'name': 'South Korea'},
    {'id': 'SS', 'name': 'South Sudan'},
    {'id': 'ES', 'name': 'Spain'},
    {'id': 'LK', 'name': 'Sri Lanka'},
    {'id': 'SD', 'name': 'Sudan'},
    {'id': 'SR', 'name': 'Suriname'},
    {'id': 'SE', 'name': 'Sweden'},
    {'id': 'CH', 'name': 'Switzerland'},
    {'id': 'SY', 'name': 'Syria'},
    {'id': 'TJ', 'name': 'Tajikistan'},
    {'id': 'TZ', 'name': 'Tanzania'},
    {'id': 'TH', 'name': 'Thailand'},
    {'id': 'TG', 'name': 'Togo'},
    {'id': 'TO', 'name': 'Tonga'},
    {'id': 'TT', 'name': 'Trinidad and Tobago'},
    {'id': 'TN', 'name': 'Tunisia'},
    {'id': 'TR', 'name': 'Turkey'},
    {'id': 'TM', 'name': 'Turkmenistan'},
    {'id': 'TV', 'name': 'Tuvalu'},
    {'id': 'UG', 'name': 'Uganda'},
    {'id': 'UA', 'name': 'Ukraine'},
    {'id': 'AE', 'name': 'United Arab Emirates'},
    {'id': 'GB', 'name': 'United Kingdom'},
    {'id': 'US', 'name': 'United States of America'},
    {'id': 'UY', 'name': 'Uruguay'},
    {'id': 'UZ', 'name': 'Uzbekistan'},
    {'id': 'VU', 'name': 'Vanuatu'},
    {'id': 'VE', 'name': 'Venezuela'},
    {'id': 'VN', 'name': 'Vietnam'},
    {'id': 'YE', 'name': 'Yemen'},
    {'id': 'ZM', 'name': 'Zambia'},
    {'id': 'ZW', 'name': 'Zimbabwe'},
  ];

  static List<String> passportfield = ["Passport", "NID"];

  bool istoggle = false;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);

    return PopScope(
      canPop: true,
      onPopInvoked: (val) {
        if (!Provider.of<FranchiseMemberProvider>(context, listen: false)
            .isEdit) {
          Provider.of<FranchiseMemberProvider>(context, listen: false)
              .setEditProfile();
        }
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: themeChange.theme == ThemeMode.light
            ? Colors.grey.shade200
            : kblack,
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              if (!Provider.of<FranchiseMemberProvider>(context, listen: false)
                  .isEdit) {
                Provider.of<FranchiseMemberProvider>(context, listen: false)
                    .setEditProfile();
              }
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.deepOrange,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.black.withOpacity(0.4)),
          iconTheme: const IconThemeData(color: kwhite),
          title: const CustomPoppinsText(
            text: "Member Information",
            color: kwhite,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          actions: [
            Provider.of<FranchiseMemberProvider>(context).isEdit
                ? InkWell(
                    onTap: () {
                      Provider.of<FranchiseMemberProvider>(context,
                              listen: false)
                          .setEditProfile();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 2,
                        bottom: 2,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kwhite),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.deepOrange,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CustomPoppinsText(
                            text: "Edit",
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ],
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      if (globalKey.currentState!.validate()) {
                        Provider.of<FranchiseMemberProvider>(context,
                                listen: false)
                            .checkIsEditOrNot(context);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 4,
                        bottom: 4,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kwhite),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.save_alt,
                            color: Colors.deepOrange,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CustomPoppinsText(
                            text: "Save",
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ],
                      ),
                    ),
                  ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        body: ProgressHUD(
          key: UniqueKey(),
          inAsyncCall: Provider.of<FranchiseMemberProvider>(context).isLoading,
          opacity: 0.3,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Consumer<FranchiseMemberProvider>(
                  builder: (context, franModel, _) {
                final data = franModel.memberAllDetails;
                return Form(
                  key: globalKey,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: themeChange.theme == ThemeMode.light
                                ? Colors.white
                                : const Color.fromARGB(255, 98, 97, 97),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                          "${Config.imgkitUrl + (data?.profilePic ?? '')}?tr=w-350&ip=$randomKey",
                                      placeholder: (context, url) =>
                                          const SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Center(
                                          child: CircularProgressIndicator
                                              .adaptive(),
                                        ),
                                      ),
                                      imageBuilder: (context, imageProvider) {
                                        CachedNetworkImage.evictFromCache(
                                            '${Config.imgkitUrl + (data?.profilePic ?? '')}?tr=w-350&ip=$randomKey');
                                        return Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.fill,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            border: Border.all(
                                              color: kgrey,
                                            ),
                                          ),
                                        );
                                      },
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                            image: AssetImage(
                                              'assets/app_icon.png',
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          border: Border.all(
                                            color: kgrey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomPoppinsText(
                                            text: widget.model.fullName ?? '',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            maxLine: 1,
                                            textOverflow: TextOverflow.ellipsis,
                                          ),
                                          CustomPoppinsText(
                                            text: widget.model.refCode ?? '',
                                            color: themeChange.theme ==
                                                    ThemeMode.light
                                                ? Colors.deepOrange
                                                : kwhite,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          CustomPoppinsText(
                                            text: Utils.formatDateOnly(
                                                widget.model.registrationDate),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Switch(
                                          value: widget.model.status ?? false,
                                          onChanged: (val) {
                                            if (!(data?.status ?? false)) {
                                              Provider.of<FranchiseMemberProvider>(
                                                      context,
                                                      listen: false)
                                                  .addActiveMember(
                                                data?.userId ?? '',
                                                (val) {
                                                  if (val != null) {
                                                    Utils.showToastMessage(
                                                      context,
                                                      val,
                                                      position:
                                                          StyledToastPosition
                                                              .top,
                                                    );
                                                  } else {
                                                    Utils.showToastMessage(
                                                      context,
                                                      'Something went wrong',
                                                      isError: true,
                                                      position:
                                                          StyledToastPosition
                                                              .top,
                                                    );
                                                  }
                                                },
                                              );
                                            } else {
                                              Provider.of<FranchiseMemberProvider>(
                                                      context,
                                                      listen: false)
                                                  .deactiveMember(
                                                data?.userId ?? '',
                                                (val) {
                                                  if (val != null) {
                                                    Utils.showToastMessage(
                                                      context,
                                                      val,
                                                      position:
                                                          StyledToastPosition
                                                              .top,
                                                    );
                                                  } else {
                                                    Utils.showToastMessage(
                                                      context,
                                                      'Something went wrong',
                                                      isError: true,
                                                      position:
                                                          StyledToastPosition
                                                              .top,
                                                    );
                                                  }
                                                },
                                              );
                                            }
                                            Navigator.pop(context);
                                          }),
                                      (widget.model.status ?? false)
                                          ? const CustomPoppinsText(
                                              text: "Active",
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: kgreen,
                                            )
                                          : const CustomPoppinsText(
                                              text: "Inactive",
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: kred,
                                            )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          if (franModel.deliverymanimage != null ||
                              data?.profilePic != null)
                            Stack(
                              children: [
                                if (franModel.deliverymanimage != null)
                                  Container(
                                    width:
                                        ResponsiveRatio().width(context, 0.15),
                                    height:
                                        ResponsiveRatio().width(context, 0.15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: FileImage(
                                              franModel.deliverymanimage!),
                                          fit: BoxFit.fill),
                                    ),
                                  )
                                else
                                  CachedNetworkImage(
                                    imageUrl:
                                        "${Config.imgkitUrl + (data?.profilePic ?? '')}?tr=w-350&ip=$a",
                                    placeholder: (context, url) => SizedBox(
                                      width: ResponsiveRatio()
                                          .width(context, 0.15),
                                      height: ResponsiveRatio()
                                          .width(context, 0.15),
                                      child: const Center(
                                          child: CircularProgressIndicator
                                              .adaptive()),
                                    ),
                                    errorWidget: (context, url, error) {
                                      return const Icon(Icons.error);
                                    },
                                    imageBuilder: (context, imageProvider) {
                                      CachedNetworkImage.evictFromCache(
                                          "${Config.imgkitUrl + (data?.profilePic ?? '')}?tr=w-350&ip=$a");
                                      return Container(
                                        width: ResponsiveRatio()
                                            .width(context, 0.15),
                                        height: ResponsiveRatio()
                                            .width(context, 0.15),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                      if (!franModel.isEdit) {
                                        franModel.removedeliverymanimage();
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
                                if (franModel.isEdit) {
                                  return;
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
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
                                                        await franModel
                                                            .pickdeliverymanImage(
                                                                ImageSource
                                                                    .gallery);
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
                                                        await franModel
                                                            .pickdeliverymanImage(
                                                                ImageSource
                                                                    .camera);
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
                                }
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.camera_alt_rounded,
                                            size: 35,
                                            color: themeChange.theme ==
                                                    ThemeMode.light
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
                                                  ? Colors.black
                                                      .withOpacity(0.6)
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
                          kheight15,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  readOnly: franModel.isEdit,
                                  cursorColor: korange,
                                  controller: franModel.firstName,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'Enter name',
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: korange.withOpacity(0.4)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: korange, width: 2),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(color: kred),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      size: 20,
                                    ),
                                  ),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "* Name Required";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          IntlPhoneField(
                            controller: franModel.phoneNumber,
                            readOnly: franModel.isEdit,
                            decoration: InputDecoration(
                              isDense: true,
                              counterText: "",
                              filled: true,
                              hintText: "Enter your phone number",
                              hintStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.6),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: korange.withOpacity(0.4),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: korange, width: 2),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: kred),
                              ),
                            ),
                            initialCountryCode: franModel.countryCode ?? "AE",
                            languageCode: "en",
                            onChanged: (phone) {},
                            onCountryChanged: (country) {
                              // if (!franModel.isEdit) {
                              ls.log(country.dialCode);
                              franModel.setCountryCode(country.dialCode);
                              // }
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              franModel.isEdit
                                  ? Expanded(
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: themeChange.theme ==
                                                      ThemeMode.light
                                                  ? Colors.orange.shade200
                                                  : korange.withOpacity(0.6),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomPoppinsText(
                                                text: franModel.worldtext,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                                size: 25,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton2<String>(
                                          items: overtheworld
                                              .map((String item) =>
                                                  DropdownMenuItem<String>(
                                                    value: item,
                                                    child: CustomPoppinsText(
                                                      text: item,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ))
                                              .toList(),
                                          value: franModel.worldtext,
                                          onChanged: (String? value) {
                                            franModel.setWorldText(value);
                                          },
                                          buttonStyleData: ButtonStyleData(
                                            height: 50,
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: themeChange.theme ==
                                                        ThemeMode.light
                                                    ? Colors.orange.shade200
                                                    : korange.withOpacity(0.6),
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            offset: const Offset(0, -6),
                                            scrollbarTheme: ScrollbarThemeData(
                                              radius: const Radius.circular(40),
                                              thickness: MaterialStateProperty
                                                  .all<double>(6),
                                              thumbVisibility:
                                                  MaterialStateProperty.all<
                                                      bool>(true),
                                            ),
                                          ),
                                          menuItemStyleData:
                                              const MenuItemStyleData(
                                            height: 40,
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10),
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
                            onTap: () {
                              if (franModel.isEdit) {
                                return;
                              } else {
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
                              }
                            },
                            readOnly: true,
                            controller: franModel.nationalitycontroller,
                            decoration: InputDecoration(
                              filled: true,
                              isDense: true,
                              hintText: "Nationality",
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: themeChange.theme == ThemeMode.light
                                        ? Colors.orange.shade200
                                        : kwhite),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: themeChange.theme == ThemeMode.light
                                        ? Colors.orange.shade200
                                        : korange.withOpacity(0.6)),
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
                          franModel.isEdit
                              ? Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            themeChange.theme == ThemeMode.light
                                                ? Colors.orange.shade200
                                                : korange.withOpacity(0.6),
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomPoppinsText(
                                          text: franModel.passporttext,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black.withOpacity(0.6),
                                          size: 25,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : DropdownButtonHideUnderline(
                                  child: DropdownButton2<String>(
                                    isExpanded: true,
                                    items: passportfield
                                        .map((String item) =>
                                            DropdownMenuItem<String>(
                                              value: item,
                                              child: CustomPoppinsText(
                                                text: item,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ))
                                        .toList(),
                                    value: franModel.passporttext,
                                    onChanged: (String? value) {
                                      franModel.setProofId(value);
                                    },
                                    buttonStyleData: ButtonStyleData(
                                      height: 50,
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: korange.withOpacity(0.6),
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
                                            MaterialStateProperty.all<double>(
                                                6),
                                        thumbVisibility:
                                            MaterialStateProperty.all<bool>(
                                                true),
                                      ),
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                    ),
                                  ),
                                ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            readOnly: franModel.isEdit,
                            cursorColor: korange,
                            controller: franModel.proofIdNoController,
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "Ex: XXXXX-XXXXXXX-X",
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: korange.withOpacity(0.4)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: korange, width: 2)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (val) {
                              if (franModel.passporttext == 'Passport') {
                                return franModel.validatePassport(val ?? '');
                              } else {
                                return franModel.validateNationalID(val ?? '');
                              }
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              data?.proofIDFrontImage != null ||
                                      franModel.proofIdFrontImage != null
                                  ? Expanded(
                                      child: Stack(
                                        children: [
                                          if (franModel.proofIdFrontImage !=
                                              null)
                                            Container(
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
                                                    image: FileImage(franModel
                                                        .proofIdFrontImage!),
                                                    fit: BoxFit.fill),
                                              ),
                                              height: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.4,
                                            )
                                          else
                                            CachedNetworkImage(
                                                imageUrl:
                                                    "${Config.imgkitUrl + (data?.proofIDFrontImage ?? '')}?tr=w-350&ip=$b",
                                                placeholder: (context, url) =>
                                                    SizedBox(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
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
                                                  CachedNetworkImage
                                                      .evictFromCache(
                                                    "${Config.imgkitUrl + (data?.proofIDFrontImage ?? '')}?tr=w-350&ip=$b",
                                                  );
                                                  return Container(
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.4,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors
                                                              .grey.shade300,
                                                          blurRadius: 3,
                                                          offset: const Offset(
                                                              0, 0.75),
                                                        ),
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
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
                                                if (!franModel.isEdit) {
                                                  franModel.removeImage(
                                                      type: 'passport-front');
                                                }
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
                                          if (franModel.isEdit) {
                                            return;
                                          } else {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    titlePadding:
                                                        EdgeInsets.zero,
                                                    title: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        const CustomPoppinsText(
                                                          text:
                                                              "Select Profile Picture",
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                                                onTap:
                                                                    () async {
                                                                  franModel
                                                                      .pickImage(
                                                                    ImageSource
                                                                        .gallery,
                                                                    type:
                                                                        'passport-front',
                                                                  );
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.2),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              15),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      const Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        CustomPoppinsText(
                                                                      text:
                                                                          "GALLARY",
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  franModel
                                                                      .pickImage(
                                                                    ImageSource
                                                                        .camera,
                                                                    type:
                                                                        'passport-front',
                                                                  );
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    color:
                                                                        kblack,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              15),
                                                                    ),
                                                                  ),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child:
                                                                      const Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        CustomPoppinsText(
                                                                      text:
                                                                          "CAMERA",
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color:
                                                                          kwhite,
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
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          height: 100,
                                          child: DottedBorder(
                                              radius: const Radius.circular(10),
                                              dashPattern: const [10, 3],
                                              color: korange,
                                              borderType: BorderType.RRect,
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.camera_alt_rounded,
                                                      size: 35,
                                                      color: themeChange
                                                                  .theme ==
                                                              ThemeMode.light
                                                          ? Colors.black
                                                              .withOpacity(0.6)
                                                          : kwhite,
                                                    ),
                                                    CustomPoppinsText(
                                                      text: "Front Image",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: themeChange
                                                                  .theme ==
                                                              ThemeMode.light
                                                          ? Colors.black
                                                              .withOpacity(0.6)
                                                          : kwhite,
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
                              data?.proofIDBackImage != null ||
                                      franModel.proofIdBackImage != null
                                  ? Expanded(
                                      child: Stack(
                                        children: [
                                          if (franModel.proofIdBackImage !=
                                              null)
                                            Container(
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
                                                    image: FileImage(franModel
                                                        .proofIdBackImage!),
                                                    fit: BoxFit.fill),
                                              ),
                                              height: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.4,
                                            )
                                          else
                                            CachedNetworkImage(
                                                imageUrl:
                                                    "${Config.imgkitUrl + (data?.proofIDBackImage ?? '')}?tr=w-350&ip=$c",
                                                placeholder: (context, url) =>
                                                    SizedBox(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
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
                                                  CachedNetworkImage
                                                      .evictFromCache(
                                                    "${Config.imgkitUrl + (data?.proofIDBackImage ?? '')}?tr=w-350&ip=$c",
                                                  );
                                                  return Container(
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.4,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors
                                                              .grey.shade300,
                                                          blurRadius: 3,
                                                          offset: const Offset(
                                                              0, 0.75),
                                                        ),
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
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
                                                if (!franModel.isEdit) {
                                                  franModel.removeImage(
                                                      type: 'passport-back');
                                                }
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
                                          if (franModel.isEdit) {
                                            return;
                                          } else {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                    titlePadding:
                                                        EdgeInsets.zero,
                                                    title: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        const CustomPoppinsText(
                                                          text:
                                                              "Select Profile Picture",
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                                                onTap:
                                                                    () async {
                                                                  franModel.pickImage(
                                                                      ImageSource
                                                                          .gallery,
                                                                      type:
                                                                          'passport-back');
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.2),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              15),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      const Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        CustomPoppinsText(
                                                                      text:
                                                                          "GALLARY",
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  franModel
                                                                      .pickImage(
                                                                    ImageSource
                                                                        .camera,
                                                                    type:
                                                                        'passport-back',
                                                                  );
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration: const BoxDecoration(
                                                                      color:
                                                                          kblack,
                                                                      borderRadius:
                                                                          BorderRadius.only(
                                                                              bottomRight: Radius.circular(15))),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child:
                                                                      const Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        CustomPoppinsText(
                                                                      text:
                                                                          "CAMERA",
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color:
                                                                          kwhite,
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
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          height: 100,
                                          child: DottedBorder(
                                              radius: const Radius.circular(10),
                                              dashPattern: const [10, 3],
                                              color: korange,
                                              borderType: BorderType.RRect,
                                              child: const Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.camera_alt_rounded,
                                                      size: 35,
                                                    ),
                                                    CustomPoppinsText(
                                                      text: "Back Image",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            readOnly: franModel.isEdit,
                            cursorColor: korange,
                            keyboardType: TextInputType.number,
                            controller: franModel.ageController,
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "Enter Age",
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: korange.withOpacity(0.4)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: korange, width: 2)),
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
                            readOnly: true,
                            controller: franModel.dataOfBrithController,
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "Date of Birth",
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    if (franModel.isEdit) {
                                      return;
                                    } else {
                                      franModel.startdate(context);
                                    }
                                  },
                                  child: const Icon(Icons.calendar_month,
                                      size: 25)),
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: korange.withOpacity(0.6)),
                              ),
                              suffixIconColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      states.contains(MaterialState.focused)
                                          ? korange
                                          : Colors.black.withOpacity(0.8)),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: korange, width: 2),
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
                          const CustomPoppinsText(
                            text: "Driving license",
                            fontWeight: FontWeight.w600,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              data?.drivingLicenseFrontImage != null ||
                                      franModel.frontlicenseimage != null
                                  ? Expanded(
                                      child: Stack(
                                        children: [
                                          if (franModel.frontlicenseimage !=
                                              null)
                                            Container(
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
                                                    image: FileImage(franModel
                                                        .frontlicenseimage!),
                                                    fit: BoxFit.fill),
                                              ),
                                              height: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.4,
                                            )
                                          else
                                            CachedNetworkImage(
                                                imageUrl:
                                                    "${Config.imgkitUrl + (data?.drivingLicenseFrontImage ?? '')}?tr=w-350&ip=$d",
                                                placeholder: (context, url) =>
                                                    SizedBox(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
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
                                                  CachedNetworkImage
                                                      .evictFromCache(
                                                    "${Config.imgkitUrl + (data?.drivingLicenseFrontImage ?? '')}?tr=w-350&ip=$d",
                                                  );
                                                  return Container(
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.4,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors
                                                              .grey.shade300,
                                                          blurRadius: 3,
                                                          offset: const Offset(
                                                              0, 0.75),
                                                        ),
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
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
                                                if (!franModel.isEdit) {
                                                  franModel.removeImage(
                                                      type: 'license-front');
                                                }
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
                                          if (franModel.isEdit) {
                                            return;
                                          } else {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                    titlePadding:
                                                        EdgeInsets.zero,
                                                    title: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        const CustomPoppinsText(
                                                          text:
                                                              "Select Profile Picture",
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                                                onTap:
                                                                    () async {
                                                                  franModel.pickImage(
                                                                      ImageSource
                                                                          .gallery,
                                                                      type:
                                                                          'license-front');
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.2),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              15),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      const Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        CustomPoppinsText(
                                                                      text:
                                                                          "GALLARY",
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  franModel
                                                                      .pickImage(
                                                                    ImageSource
                                                                        .camera,
                                                                    type:
                                                                        'license-front',
                                                                  );
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration: const BoxDecoration(
                                                                      color:
                                                                          kblack,
                                                                      borderRadius:
                                                                          BorderRadius.only(
                                                                              bottomRight: Radius.circular(15))),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child:
                                                                      const Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        CustomPoppinsText(
                                                                      text:
                                                                          "CAMERA",
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color:
                                                                          kwhite,
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
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          height: 100,
                                          child: DottedBorder(
                                              radius: const Radius.circular(10),
                                              dashPattern: const [10, 3],
                                              color: korange,
                                              borderType: BorderType.RRect,
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.camera_alt_rounded,
                                                      size: 35,
                                                      color: themeChange
                                                                  .theme ==
                                                              ThemeMode.light
                                                          ? Colors.black
                                                              .withOpacity(0.6)
                                                          : kwhite,
                                                    ),
                                                    CustomPoppinsText(
                                                      text: "Front Image",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: themeChange
                                                                  .theme ==
                                                              ThemeMode.light
                                                          ? Colors.black
                                                              .withOpacity(0.6)
                                                          : kwhite,
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
                              data?.drivingLicenseBackImage != null ||
                                      franModel.backlicenseimage != null
                                  ? Expanded(
                                      child: Stack(
                                        children: [
                                          if (franModel.backlicenseimage !=
                                              null)
                                            Container(
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
                                                    image: FileImage(franModel
                                                        .backlicenseimage!),
                                                    fit: BoxFit.fill),
                                              ),
                                              height: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.4,
                                            )
                                          else
                                            CachedNetworkImage(
                                              imageUrl:
                                                  "${Config.imgkitUrl + (data?.drivingLicenseBackImage ?? '')}?tr=w-350&ip=$e",
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
                                                CachedNetworkImage
                                                    .evictFromCache(
                                                  "${Config.imgkitUrl + (data?.drivingLicenseBackImage ?? '')}?tr=w-350&ip=$e",
                                                );
                                                return Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.4,
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors
                                                            .grey.shade300,
                                                        blurRadius: 3,
                                                        offset: const Offset(
                                                            0, 0.75),
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
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
                                                if (!franModel.isEdit) {
                                                  franModel.removeImage(
                                                      type: 'license-back');
                                                }
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
                                          if (franModel.isEdit) {
                                            return;
                                          } else {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    titlePadding:
                                                        EdgeInsets.zero,
                                                    title: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        const CustomPoppinsText(
                                                          text:
                                                              "Select Profile Picture",
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                                                onTap:
                                                                    () async {
                                                                  franModel
                                                                      .pickImage(
                                                                    ImageSource
                                                                        .gallery,
                                                                    type:
                                                                        'license-back',
                                                                  );
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.2),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              15),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      const Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        CustomPoppinsText(
                                                                      text:
                                                                          "GALLARY",
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  franModel.pickImage(
                                                                      ImageSource
                                                                          .camera,
                                                                      type:
                                                                          'license-back');
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration: const BoxDecoration(
                                                                      color:
                                                                          kblack,
                                                                      borderRadius:
                                                                          BorderRadius.only(
                                                                              bottomRight: Radius.circular(15))),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child:
                                                                      const Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        CustomPoppinsText(
                                                                      text:
                                                                          "CAMERA",
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color:
                                                                          kwhite,
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
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          height: 100,
                                          child: DottedBorder(
                                              radius: const Radius.circular(10),
                                              dashPattern: const [10, 3],
                                              color: korange,
                                              borderType: BorderType.RRect,
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.camera_alt_rounded,
                                                      size: 35,
                                                      color: themeChange
                                                                  .theme ==
                                                              ThemeMode.light
                                                          ? Colors.black
                                                              .withOpacity(0.6)
                                                          : kwhite,
                                                    ),
                                                    CustomPoppinsText(
                                                      text: "Back Image",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: themeChange
                                                                  .theme ==
                                                              ThemeMode.light
                                                          ? Colors.black
                                                              .withOpacity(0.6)
                                                          : kwhite,
                                                    )
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget countrySelection() {
    return StatefulBuilder(builder: (context, setStates) {
      return Consumer<FranchiseMemberProvider>(
          builder: (context, model, child) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: searchController,
                    readOnly: false,
                    decoration: const InputDecoration(
                      fillColor: kwhite,
                      hintText: 'Search Country',
                    ),
                    onChanged: (val) {
                      final result = countries
                          .where(
                            (e) => e['name']!
                                .toLowerCase()
                                .contains(val.trim().toLowerCase()),
                          )
                          .toList();
                      setStates(() {
                        searchResult = result;
                      });
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
                          const CustomPoppinsText(
                            text: 'No Result found',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
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
                          : countries.length,
                      itemBuilder: (BuildContext context, int index) {
                        final data = searchResult != null
                            ? searchResult![index]
                            : countries[index];
                        return RadioListTile.adaptive(
                          value: data['name'],
                          groupValue: model.nationalitycontroller.text,
                          title: CustomPoppinsText(
                            text: '${data['name']}',
                          ),
                          onChanged: (value) {
                            model.setNationality(value);
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
      });
    });
  }
}
