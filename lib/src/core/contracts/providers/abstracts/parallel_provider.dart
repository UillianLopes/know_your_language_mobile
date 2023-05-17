import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:know_your_language/flavors.dart';

parallelCompute(dynamic data) {
  if (data is! String) {
    return data;
  }

  return jsonDecode(data);
}

class ParallelProvider extends GetConnect {
  @override
  void onInit() {
    if (Flavors.appFlavor == Flavor.local) {
      allowAutoSignedCert = true;
    }

    httpClient.defaultDecoder = (data) async {
      return await compute(parallelCompute, data);
    };

    super.onInit();
  }
}
