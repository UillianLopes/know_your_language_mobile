import 'package:get/get.dart';
import 'package:know_your_language/src/core/contracts/facades/isign_in_facade.dart';
import 'package:know_your_language/src/core/contracts/providers/iusers_provider.dart';
import 'package:know_your_language/src/core/enums/sign_in_method.dart';
import 'package:know_your_language/src/core/models/user_model.dart';

class AuthStore extends GetxController with TokenOnStorageMixin {
  final IMultiSignInFacade _signInFacade;
  final IUsersProvider _usersProvider;
  final user$ = Rx<UserModel?>(null);

  AuthStore(this._signInFacade, this._usersProvider);

  Future<bool> signOut() async {
    return await _signInFacade.checkAndSignOut();
  }

  Future<void> initialize() async {
    final (_, method) = getTokenFromStorage();

    if (method == null) {
      Get.offAndToNamed('/sign-in');
      return;
    }

    _signInFacade.use(method);
    final isSignedIn = await _signInFacade.checkAndSignIn(canSignIn: false);
    await _handleSignedIn(isSignedIn);
  }

  Future<void> signIn(SignInMethod method) async {
    _signInFacade.use(method);
    final isSignedIn = await _signInFacade.checkAndSignIn();
    await _handleSignedIn(isSignedIn);
  }

  Future<void> _handleSignedIn(bool isSignedIn) async {
    if (isSignedIn) {
      await _loadUser();
      Get.offAndToNamed('/home');
    } else {
      Get.offAndToNamed('/sign-in');
    }
  }

  Future<void> _loadUser() async {
    final response = await _usersProvider.currentUser();
    if (response == null) {
      return;
    }
    user$.value = response.data;
  }
}
