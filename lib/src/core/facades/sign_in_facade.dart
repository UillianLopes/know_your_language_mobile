import 'package:know_your_language/src/core/enums/sign_in_method.dart';

import '../contracts/facades/isign_in_facade.dart';

class SignInFacade with TokenOnStorageMixin implements IMultiSignInFacade {
  SignInMethod _method = SignInMethod.google;

  final ISignInFacade _googleSignInFacade;
  final ISignInFacade _appleSignInFacade;

  SignInFacade(
    this._googleSignInFacade,
    this._appleSignInFacade,
  );

  @override
  Future<bool> checkAndSignIn({bool canSignIn = true}) async {
    switch (_method) {
      case SignInMethod.google:
        return await _googleSignInFacade.checkAndSignIn(canSignIn: canSignIn);

      case SignInMethod.apple:
        return await _appleSignInFacade.checkAndSignIn(canSignIn: canSignIn);
    }
  }

  @override
  Future<(String? token, SignInMethod? method)> getTokenAndMethod() async {
    return await Future.value(getTokenFromStorage());
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
}
