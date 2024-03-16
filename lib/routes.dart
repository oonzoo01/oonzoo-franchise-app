import 'package:flutter/material.dart';

import 'testig.dart';
import 'view/home/dashboard.dart';

final Map<String, WidgetBuilder> routes = {
  DashboardPage.routeName: (context) => const DashboardPage(),
  // PaymentUpgrade.routeName: (context) => const PaymentUpgrade(),
  // StoreContract.routeName: (context) => const StoreContract(),
  // ContractPdfFile.routeName: (context) => const ContractPdfFile(),
  // UpgradePackagesScreen.routeName: (context) => const UpgradePackagesScreen(),
  ImageView.r: (context) => const ImageView(),
};
