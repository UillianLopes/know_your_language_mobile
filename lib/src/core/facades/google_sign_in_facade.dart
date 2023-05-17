import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:know_your_language/src/core/contracts/facades/isign_in_facade.dart';
import 'package:know_your_language/src/core/enums/sign_in_method.dart';

class GoogleSignInFacade with TokenOnStorageMixin implements ISignInFacade {
  final GoogleSignIn _googleSignIn;

  GoogleSignInFacade(this._googleSignIn);

  @override
  Future<bool> checkAndSignIn({canSignIn = true}) async {
    final isAlreadySignedIn = await _checkToken();

    if (isAlreadySignedIn || !canSignIn) {
      return isAlreadySignedIn;
    }

    return await _signInAndCheckToken();
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

  Future<bool> _checkToken() async {
    var currentUser = _googleSignIn.currentUser;

    if (currentUser == null) {
      if (!await _googleSignIn.isSignedIn()) {
        return false;
      }

      currentUser = await _googleSignIn.signInSilently();

      if (currentUser == null) return false;
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

    return await saveTokenOnStorage(SignInMethod.google, token);
  }

  Future<bool> _signInAndCheckToken() async {
    try {
      await _googleSignIn.signIn();
      return await _checkToken();
    } catch (e) {
      Get.snackbar('Error', 'O correu um erro ao tentar se authenticar');
      return false;
    }
  }
}
