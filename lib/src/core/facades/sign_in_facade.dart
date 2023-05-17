import 'package:know_your_language/src/core/enums/sign_in_method.dart';

import '../contracts/facades/isign_in_facade.dart';

class SignInFacade implements IMultiSignInFacade {
  SignInMethod _method = SignInMethod.google;

  final ISignInFacade _googleSignInFacade;
  final ISignInFacade _appleSignInFacade;

  SignInFacade(
    this._googleSignInFacade,
    this._appleSignInFacade,
  );

  @override
  Future<bool> checkAndSignIn() async {
    switch (_method) {
      case SignInMethod.google:
        return await _googleSignInFacade.checkAndSignIn();

      case SignInMethod.apple:
        return await _appleSignInFacade.checkAndSignIn();
    }
  }

  @override
  Future<String?> getToken() async {
    switch (_method) {
      case SignInMethod.google:
        return await _googleSignInFacade.getToken();

      case SignInMethod.apple:
        return await _appleSignInFacade.getToken();
    }
  }

  @override
  Future<bool> checkAndSignOut() async {
    switch (_method) {
      case SignInMethod.google:
        return await _googleSignInFacade.checkAndSignOut();

      case SignInMethod.apple:
        return await _appleSignInFacade.checkAndSignOut();
    }
  }

  @override
  use(SignInMethod method) {
    _method = method;
  }

  @override
  Future<bool> checkToken({bool canSignIn = false}) async {
    switch (_method) {
      case SignInMethod.google:
        return await _googleSignInFacade.checkToken(canSignIn: canSignIn);

      case SignInMethod.apple:
        return await _appleSignInFacade.checkToken(canSignIn: canSignIn);
    }
  }
}
