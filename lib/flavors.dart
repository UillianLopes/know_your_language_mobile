enum Flavor {
  local,
  dev,
  prod,
}

class Flavors {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Know your language (dev)';
      case Flavor.prod:
        return 'Know your language (prod)';
      default:
        return 'Know your language (local)';
    }
  }

  static String get apiUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return 'https://knowyourlanguage.dev-api.com/api/v1/';
      case Flavor.prod:
        return 'https://knowyourlanguage.api.com/api/v1/';
      default:
        return 'https://local.knowyourlanguage.com:3000/api/v1/';
    }
  }
}
