import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:know_your_language/src/core/contracts/facades/isign_in_facade.dart';
import 'package:know_your_language/src/core/enums/sign_in_method.dart';

class GoogleSignInFacade with TokenOnStorageMixin implements ISignInFacade {
  final GoogleSignIn _googleSignIn;

  GoogleSignInFacade(this._googleSignIn);

  @override
  Future<bool> checkAndSignIn() async {
    if (await _googleSignIn.isSignedIn()) {
      return await checkToken(canSignIn: true);
    } else {
      return await _signInAndCheckToken();
    }
  }

  @override
  Future<String?> getToken() {
    return Future.value(getTokenFromStorage());
  }

  @override
  Future<bool> checkAndSignOut() async {
    if (!(await _googleSignIn.isSignedIn())) {
      return false;
    }

    await _googleSignIn.signOut();
    removeTokenFromStorage();
    return true;
  }

  @override
  Future<bool> checkToken({bool canSignIn = false}) async {
    var currentUser = _googleSignIn.currentUser;
    if (currentUser == null) {
      currentUser = await _googleSignIn.signInSilently();
      if (currentUser == null) {
        Get.snackbar('Erro', 'Não foi possivel se authenticar com o google');
        await Future.delayed(2000.ms);

        if (canSignIn) {
          return await _signInAndCheckToken();
        }

        return false;
      }
    }
    await _loadTokenFromAccountAndSaveOnStorage(currentUser);
    return true;
  }

  Future<bool> _loadTokenFromAccountAndSaveOnStorage(
    GoogleSignInAccount account,
  ) async {
    final signInAuthentication = await account.authentication;
    final token = signInAuthentication.idToken;

    if (token == null) {
      return false;
    }

    return await saveTokenOnStorage(token) &&
        await saveMethodOnStoage(SignInMethod.google);
  }

  Future<bool> _signInAndCheckToken() async {
    try {
      await _googleSignIn.signIn();
      return await checkToken();
    } catch (e) {
      Get.snackbar('Error', 'O correu um erro ao tentar se authenticar');
      return false;
    }
  }
}
