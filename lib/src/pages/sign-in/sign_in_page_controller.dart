import 'package:get/get.dart';
import 'package:know_your_language/src/core/stores/auth_store.dart';

class SignInPageController extends GetxController {
  final AuthStore _authControler;

  SignInPageController(
    this._authControler,
  );

  signInWithGoogle() async {
    await _authControler.signInWithGoogle();
  }
}
