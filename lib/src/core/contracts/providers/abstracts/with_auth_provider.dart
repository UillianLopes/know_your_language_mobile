import 'package:get/get.dart';
import 'package:know_your_language/src/core/contracts/facades/isign_in_facade.dart';
import 'parallel_provider.dart';

abstract class WithAuthProvider extends ParallelProvider
    with TokenOnStorageMixin {
  WithAuthProvider() : super();

  @override
  void onInit() async {
    super.onInit();
    timeout = 30.seconds;
    httpClient.timeout = 30.seconds;
    httpClient.addRequestModifier<Object?>((request) async {
      final (token, signInMethod) = await getTokenFromStorage();

      if (token != null && signInMethod != null) {
        request.headers['sign-in-method'] = signInMethod.name;
        request.headers['authorization'] = 'Bearer $token';
      }

      return request;
    });
  }
}
