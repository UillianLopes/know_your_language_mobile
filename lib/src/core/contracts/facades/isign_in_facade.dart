import 'package:get/get.dart';
import 'package:know_your_language/src/core/constants/store_keys.dart';
import 'package:know_your_language/src/core/contracts/facades/istorage_facade.dart';

import '../../enums/sign_in_method.dart';

mixin TokenOnStorageMixin {
  (String?, SignInMethod?) getTokenFromStorage() {
    final storageFacade = Get.find<IStorageFacade>();
    SignInMethod? method;
    final methodIndex = storageFacade.getInt(StoreKeys.authenticationMethod);

    if (methodIndex != null) method = SignInMethod.values[methodIndex];

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
