import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:know_your_language/src/core/constants/store_keys.dart';
import 'package:know_your_language/src/core/contracts/facades/istorage_facade.dart';

import '../../enums/sign_in_method.dart';

mixin TokenOnStorageMixin {
  Future<(String?, SignInMethod?)> getTokenFromStorage() async {
    final storageFacade = Get.find<IStorageFacade>();
    final signIn = Get.find<IMultiSignInFacade>();
    SignInMethod? method;
    final methodIndex = storageFacade.getInt(StoreKeys.authenticationMethod);

    if (methodIndex != null) method = SignInMethod.values[methodIndex];

    String? token = storageFacade.getString(StoreKeys.authenticationToken);

    if (token != null && method != null && JwtDecoder.isExpired(token)) {
      signIn.use(method);
      final isSignedIn = await signIn.checkAndSignIn(canSignIn: false);

      if (isSignedIn) {
        token = storageFacade.getString(StoreKeys.authenticationToken);
      }
    }

    return (
      storageFacade.getString(StoreKeys.authenticationToken),
      method,
    );
  }

  Future<bool> saveTokenOnStorage(SignInMethod method, String token) async {
    final storageFacade = Get.find<IStorageFacade>();
    await storageFacade.setInt(StoreKeys.authenticationMethod, method.index);
    await storageFacade.setString(StoreKeys.authenticationToken, token);
    return true;
  }

  Future<bool> removeTokenFromStorage() async {
    final storageFacade = Get.find<IStorageFacade>();
    await storageFacade.remove(StoreKeys.authenticationToken);
    await storageFacade.remove(StoreKeys.authenticationMethod);
    return true;
  }
}

abstract class ISignInFacade {
  Future<bool> checkAndSignIn({bool canSignIn = true});

  Future<bool> checkAndSignOut();
}

abstract class IMultiSignInFacade implements ISignInFacade {
  use(SignInMethod method);

  Future<(String? token, SignInMethod? method)> getTokenAndMethod();
}
