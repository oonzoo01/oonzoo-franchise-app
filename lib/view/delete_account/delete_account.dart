import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/constant/colors/colors.dart';
import 'package:salesapp/constant/responsive.dart';
import 'package:salesapp/provider/profile_provider/profile_provider.dart';

import '../../api/shared_service.dart';
import '../../common_widget/custom_poppins.dart';
import '../../constant/const_data.dart';
import '../../model/delete_account/delete_account.dart';
import '../../provider/loader_provider/loader_provider.dart';
import '../../utils/utils.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  static String routeName = 'DeleteAccount';

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  bool isAcceptedCondition = false;

  DeleteAccountReasons? selectedReason;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        backgroundColor: kwhite,
        surfaceTintColor: Colors.white,
        forceMaterialTransparency: true,
        elevation: 10,
        title: Image.asset(
          'assets/icon/logo.png',
          width: 100,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const CustomPoppinsText(
              text: 'CANCEL',
              color: kblack,
              fontSize: 14,
            ),
          )
        ],
      ),
      body: Provider.of<LoaderProvider>(context).isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0).copyWith(top: 10),
              child: ListView(
                children: [
                  const CustomPoppinsText(
                    text: 'DELETE YOUR ACCOUNT',
                    color: kblack,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 5),
                  const CustomPoppinsText(
                    text:
                        "These terms and conditions govern the process of deleting a user account on the Oonzoo E-Commerce Application. By using the Application, you agree to abide by these Terms and understand the implications of deleting your user account. Please read these Terms carefully before proceeding with the account deletion process.",
                    color: kblack,
                    fontSize: 12,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: CustomPoppinsText(
                            text: ConstData.deleteHeading[index],
                            color: kblack,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 10),
                          child: CustomPoppinsText(
                            text: ConstData.deleteAcceptance[index],
                            color: kblack,
                            fontSize: 12,
                            textAlign: TextAlign.justify,
                          ),
                        )
                      ],
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: ConstData.deleteAcceptance.length,
                  ),
                  const SizedBox(height: 15),
                  const CustomPoppinsText(
                    text: 'I want to delete my account because',
                    color: kblack,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      deleteReasonBottomSheet(context);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: kgrey),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomPoppinsText(
                              text: selectedReason?.value ?? 'Select a reason',
                              color: kblack,
                              fontSize: 12,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: kblack,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 0.8,
                        child: Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: isAcceptedCondition,
                          onChanged: (value) {
                            setState(() {
                              isAcceptedCondition = value!;
                            });
                          },
                        ),
                      ),
                      const Flexible(
                        child: CustomPoppinsText(
                          text: 'I have read the terms and conditions',
                          color: kblack,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const CustomPoppinsText(
                    text:
                        'These changes may take 3-5 minutes to reflect on all devices',
                    color: kblack,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if (isAcceptedCondition && selectedReason != null) {
            Utils.showMessage(
                context,
                'Confirmation',
                'Would you really like to delete your account?',
                'Yes',
                () async {
                  Navigator.pop(context);
                  Provider.of<LoaderProvider>(context, listen: false)
                      .setIsLoading(true);

                  Provider.of<ProfileProvider>(context, listen: false)
                      .deleteCustomerAccount((val) async {
                    if (val) {
                      Provider.of<LoaderProvider>(context, listen: false)
                          .setIsLoading(false);
                      Utils.showToastMessage(
                        context,
                        'Account Deleted',
                        position: StyledToastPosition.top,
                      );

                      await SharedService.logout();
                    } else {
                      Utils.showToastMessage(
                        context,
                        'Something went wrong',
                        isError: true,
                        position: StyledToastPosition.top,
                      );
                    }
                  });
                },
                isConfirmationDialog: true,
                buttonText2: 'No',
                onPressed2: () {
                  Navigator.pop(context);
                });
          }
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10).copyWith(bottom: 20),
          color: kwhite,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isAcceptedCondition && selectedReason != null
                  ? lightOrange
                  : kgrey,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(Platform.isIOS ? 20 : 10),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPoppinsText(
                  text: 'DELETE YOUR ACCOUNT',
                  color: kwhite,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Delete Reason Bottom Sheet

  Future<dynamic> deleteReasonBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setStates) {
          return SizedBox(
            height: ResponsiveRatio().height(context, 0.8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.cancel,
                    size: 60,
                    color: kwhite,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                        children: DeleteAccountReasons.values
                            .map(
                              (e) => RadioListTile.adaptive(
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                value: e,
                                groupValue: selectedReason,
                                onChanged: (value) {
                                  setStates(() {
                                    selectedReason = value;
                                  });
                                  setState(() {});
                                  Navigator.pop(context);
                                },
                                title: CustomPoppinsText(
                                  text: e.value,
                                  color: kblack,
                                  fontWeight: selectedReason == e
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                ),
                              ),
                            )
                            .toList()),
                  ),
                )
              ],
            ),
          );
        });
      },
    );
  }
}
