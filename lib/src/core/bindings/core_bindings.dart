import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:know_your_language/src/core/contracts/providers/irankings_provider.dart';
import 'package:know_your_language/src/core/contracts/providers/iwords_provider.dart';
import 'package:know_your_language/src/core/stores/auth_store.dart';
import 'package:know_your_language/src/core/stores/core_store.dart';
import 'package:know_your_language/src/core/providers/rankings_provider.dart';

import '../contracts/facades/istorage_facade.dart';
import '../contracts/providers/iusers_provider.dart';
import '../facades/shared_preferences_storage_facade.dart';
import '../providers/users_provider.dart';
import '../providers/words_provider.dart';

class CoreBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<IStorageFacade>(SharedPreferencesStorageFacade());
    Get.put<IUsersProvider>(UsersProvider(Get.find()));
    Get.put<IWordsProvider>(WordsProvider(Get.find()));
    Get.put<IRankingsProvider>(RankingsProvider(Get.find()));
    Get.put(
      GoogleSignIn.standard(
        scopes: ['profile', 'email', 'openid'],
      ),
    );
    Get.put(CoreStore());
    Get.put(AuthStore(Get.find(), Get.find(), Get.find()));
  }
}
