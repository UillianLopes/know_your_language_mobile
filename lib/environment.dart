class Keys {
  static const apiUrl = 'KYL_API_URL';
  static const title = 'KYL_TITLE';
}

class Environment {
  static final _map = Map.fromEntries([
    const MapEntry(Keys.apiUrl, String.fromEnvironment(Keys.apiUrl)),
    const MapEntry(Keys.title, String.fromEnvironment(Keys.title)),
  ]);

  static String get apiUrl {
    final apiUrl = _map[Keys.apiUrl] ?? '';
    if (apiUrl.isEmpty) {
      throw Exception('API URL IS NOT PRESENT IN THE ENVIRONMENT');
    }
    return apiUrl;
  }

  static String get title {
    final apiUrl = _map[Keys.title] ?? '';
    if (apiUrl.isEmpty) {
      throw Exception('TITLE IS NOT PRESENT IN THE ENVIRONMENT');
    }
    return apiUrl;
  }
}
