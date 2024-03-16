import 'package:flutter/material.dart';
// import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/login_page.dart';
import 'package:salesapp/provider/appbar_provider.dart';
import 'package:salesapp/provider/auth_provider/auth_provider.dart';
import 'package:salesapp/provider/auth_provider/forgot_password_provider.dart';
import 'package:salesapp/provider/auth_provider/login_provider.dart';
import 'package:salesapp/provider/dashboard_provider/dashboard_provider.dart';
import 'package:salesapp/provider/franchise_dashboard_provider/franchise_dashboard_provider.dart';
import 'package:salesapp/provider/franchise_onboard_sotre_provider/franchise_onboard_store_provider.dart';
import 'package:salesapp/provider/loader_provider/loader_provider.dart';
import 'package:salesapp/provider/profile_provider/profile_provider.dart';
import 'package:salesapp/provider/theme_provider.dart';
import 'package:salesapp/provider/total_team_provider/total_team_provider.dart';
import 'package:salesapp/provider/wallet_provider/wallet_provider.dart';
import 'package:salesapp/utils/language/local_storage.dart';
import 'package:salesapp/view/splash/splash.dart';
import 'package:sizer/sizer.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'api/shared_service.dart';
import 'provider/auth_provider/register_provider.dart';
import 'provider/franchise_insight/franchise_insight.dart';
import 'provider/franchise_member_provider/franchise_member_provider.dart';
import 'utils/theme_utils.dart';
import 'routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Widget _defaultHome = const SignInPage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);

  bool isLoggedIn = await SharedService.isLoggedIn();
  final loginDetails = await SharedService.loginDetails();
  if (isLoggedIn) {
    _defaultHome = SplashScreen(
      type: loginDetails?.partnerType ?? '',
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext ctx, Locale newLocale) {
    _MyAppState? state = ctx.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => setLocale(locale));
    super.didChangeDependencies();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (context) => PaginationProvider(),
        // ),
        ChangeNotifierProvider(
          create: (context) => AppBarProvider(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => ContractProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (context) => SellerPackageProvider(),
        // ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TotalTeamProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DashboardProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FranchiseMemberProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ForgotPasswordProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FranchiseOnboardStoreProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WalletProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FranchiseDashboardProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FranchiseInsight(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoaderProvider(),
        ),
      ],
      child: Sizer(
        builder: (
          BuildContext context,
          Orientation orientation,
          DeviceType deviceType,
        ) {
          final changeTheme = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: '',
            debugShowCheckedModeBanner: false,
            themeMode: changeTheme.theme,
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            navigatorKey: navigatorKey,
            home: _defaultHome,
            // home: TEsting(),
            routes: routes,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: _locale,
            // localizationsDelegates: const [
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            // ],
            // supportedLocales: const [
            //   Locale('en'), // English
            //   Locale('ar'), // Arabic
            //   Locale('hi'), // Hindi
            // ],
          );
        },
      ),
    );
  }
}
