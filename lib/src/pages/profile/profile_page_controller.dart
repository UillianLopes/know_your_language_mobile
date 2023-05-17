import 'package:get/get.dart';
import 'package:know_your_language/src/core/stores/auth_store.dart';

class ProfilePageController extends GetxController {
  final AuthStore _authStore;

  ProfilePageController(this._authStore);

  Future<void> signOut() async {
    final sigendIn = await _authStore.signOut();

    if (sigendIn) Get.offAllNamed('/sign-in');
  }
}
