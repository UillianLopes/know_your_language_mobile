import 'package:know_your_language/src/core/contracts/facades/isign_in_facade.dart';

import '../../facades/istorage_facade.dart';
import 'parallel_provider.dart';

abstract class WithAuthProvider extends ParallelProvider
    with TokenOnStorageMixin {
  WithAuthProvider() : super();

  @override
  void onInit() async {
    super.onInit();
    httpClient.addRequestModifier<Object?>((request) {
      final (token, _) = getTokenFromStorage();

      if (token != null) {
        request.headers['Authorization'] = 'Bearer $token';
      }

      return request;
    });
  }
}
