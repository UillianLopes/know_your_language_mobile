import '../contracts/facades/isign_in_facade.dart';

class AppleSignInFacade with TokenOnStorageMixin implements ISignInFacade {
  @override
  Future<bool> checkAndSignIn({bool canSignIn = true}) {
    throw UnimplementedError();
  }

  @override
  Future<bool> checkAndSignOut() {
    throw UnimplementedError();
  }

  Future<bool> checkToken({bool canSignIn = false}) {
    throw UnimplementedError();
  }
}
