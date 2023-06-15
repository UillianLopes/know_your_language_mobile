import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:know_your_language/src/core/bindings/core_bindings.dart';
import 'package:know_your_language/src/pages/guess_word/guess_word_page.dart';
import 'package:know_your_language/src/pages/guess_word/guess_word_page_bindings.dart';
import 'package:know_your_language/src/pages/home/home_page.dart';
import 'package:know_your_language/src/pages/home/home_page_bindings.dart';
import 'package:know_your_language/src/pages/profile/profile_page.dart';
import 'package:know_your_language/src/pages/profile/profile_page_bindings.dart';
import 'package:know_your_language/src/pages/sign_in/sign_in_page.dart';
import 'package:know_your_language/src/pages/sign_in/sign_in_page_bindings.dart';
import 'package:know_your_language/src/pages/splash/splash_page.dart';
import 'package:know_your_language/src/pages/splash/splash_page_bindings.dart';
import 'package:know_your_language/src/pages/guess_meaning/guess_meaning_page.dart';
import 'package:know_your_language/src/pages/guess_meaning/guess_meaning_page_bindings.dart';

import 'know_your_language_app_theme.dart';

class KnowYourLanguageApp extends StatelessWidget {
  const KnowYourLanguageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: CoreBindings(),
      initialRoute: '/splash',
      defaultTransition: Transition.cupertino,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/splash',
          page: () => const SplashPage(),
          binding: SplashPageBindings(),
        ),
        GetPage(
          name: '/sign-in',
          page: () => const SignInPage(),
          binding: SignInPageBindings(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomePage(),
          binding: HomePageBindings(),
        ),
        GetPage(
          name: '/guess-meaning',
          page: () => const GuessMeaningPage(),
          binding: GuessMeaningPageBindings(),
        ),
        GetPage(
          name: '/guess-word',
          page: () => const GuessWordPage(),
          binding: GuessWordPageBindings(),
        ),
        GetPage(
          name: '/profile',
          page: () => const ProfilePage(),
          binding: ProfilePageBindings(),
        )
      ],
    );
  }
}
