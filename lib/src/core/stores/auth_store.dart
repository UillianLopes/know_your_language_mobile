import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:know_your_language/src/core/constants/store_keys.dart';
import 'package:know_your_language/src/core/contracts/facades/istorage_facade.dart';
import 'package:know_your_language/src/core/contracts/providers/iusers_provider.dart';
import 'package:know_your_language/src/core/models/user_model.dart';

class AuthStore extends GetxController {
  final GoogleSignIn _googleSignIn;
  final IStorageFacade _storageFacade;
  final IUsersProvider _usersProvider;
  final user$ = Rx<UserModel?>(null);

  AuthStore(this._googleSignIn, this._storageFacade, this._usersProvider);

  Future<void> signInWithGoogle() async {
    if (await _googleSignIn.isSignedIn()) {
      await checkSignedUserWithGoogle(canCallSignIn: true);
    } else {
      await _signInWithGoogle();
    }
  }

  Future<bool> checkSignedUserWithGoogle({canCallSignIn = false}) async {
    var currentUser = _googleSignIn.currentUser;
    if (currentUser == null) {
      currentUser = await _googleSignIn.signInSilently();
      if (currentUser == null) {
        Get.snackbar('Erro', 'Não foi possivel se authenticar com o google');
        await Future.delayed(2000.ms);
        if (canCallSignIn) {
          await _signInWithGoogle();
          return await checkSignedUserWithGoogle(canCallSignIn: false);
        }

        return false;
      }
    }

    final signInAuthentication = await currentUser.authentication;
    final idToken = signInAuthentication.idToken;

    if (idToken != null) {
      _storageFacade.setString(StoreKeys.authenticationToken, idToken);
    }

    final response = await _usersProvider.currentUser();
    user$.value = response?.data;
    return true;
  }

  Future<void> _signInWithGoogle() async {
    try {
      await _googleSignIn.signIn();
      await checkSignedUserWithGoogle();
    } catch (e) {
      Get.snackbar('Error', 'O correu um erro ao tentar se authenticar');
    }
  }

  _signOutFromGoogle() {}
}
