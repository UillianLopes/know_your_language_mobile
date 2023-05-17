import 'package:know_your_language/src/core/constants/store_keys.dart';

import '../../facades/istorage_facade.dart';
import 'parallel_provider.dart';

abstract class WithAuthProvider extends ParallelProvider {
  final IStorageFacade _storageFacade;

  WithAuthProvider(this._storageFacade) : super();

  @override
  void onInit() async {
    super.onInit();
    httpClient.addRequestModifier<Object?>((request) {
      final token = _storageFacade.getString(StoreKeys.authenticationToken);

      if (token != null) {
        request.headers['Authorization'] = 'Bearer $token';
      }

      return request;
    });
  }
}
