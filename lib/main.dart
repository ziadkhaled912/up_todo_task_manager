import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:path/path.dart';
import 'package:quran_app/core/constants/database_constants.dart';
import 'package:quran_app/features/auth/authentication/authentication_page.dart';
import 'package:quran_app/features/auth/data/auth_repository.dart';
import 'package:quran_app/features/auth/login/login_page.dart';
import 'package:quran_app/features/onboarding/onboarding_page.dart';
import 'package:quran_app/generated/l10n.dart';
import 'package:quran_app/theme/quran_app_theme/app_theme.dart';
import 'package:sqflite/sqflite.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthRepository _authRepository = AuthRepository();

  @override
  void initState() {
    // _authRepository.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppTheme.currentLocale,
      builder: (context, locale, _) {
        return FutureBuilder(
          future: _authRepository.initialize(),
          builder: (context, data) {
            // if(data.connectionState == ConnectionState.done) {
              return MaterialApp(
                title: 'Flutter Demo',
                theme: AppTheme.lightTheme(),
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                locale: locale,
                supportedLocales: const [
                  Locale("en"),
                  Locale("ar"),
                ],
                home: true ? const AuthenticationPage() : const OnBoardingPage(),
              );
            // } else {
            //   return const Center(child: CircularProgressIndicator());
            // }
          },
        );
      }
    );
  }
}
