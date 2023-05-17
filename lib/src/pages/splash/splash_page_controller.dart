import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:know_your_language/src/core/contracts/facades/istorage_facade.dart';
import 'package:know_your_language/src/core/stores/auth_store.dart';

class SplashPageController extends GetxController {
  final IStorageFacade _storageFacade;
  final AuthStore _authController;

  final isLoading$ = false.obs;
  final isSignedIn$ = false.obs;

  SplashPageController(
    this._storageFacade,
    this._authController,
  );

  @override
  void onInit() async {
    super.onInit();
    isLoading$.value = true;
    await _storageFacade.initialize();
    await _initSignIn();
    await Future.delayed(3000.ms);
    isLoading$.value = false;
  }

  Future<void> _initSignIn() async {
    final isSignedIn = await _authController.checkSignedUserWithGoogle();
    if (isSignedIn) {
      Get.offAndToNamed('/home');
    } else {
      Get.offAndToNamed('/sign-in');
    }
  }
}
