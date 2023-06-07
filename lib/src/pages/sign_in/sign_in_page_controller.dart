import 'package:get/get.dart';
import 'package:know_your_language/src/core/enums/sign_in_method.dart';
import 'package:know_your_language/src/core/stores/auth_store.dart';

class SignInPageController extends GetxController {
  final AuthStore _authControler;

  SignInPageController(
    this._authControler,
  );

  signIn(SignInMethod method) async {
    await _authControler.signIn(method);
  }
}
