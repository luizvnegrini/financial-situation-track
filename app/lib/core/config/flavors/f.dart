enum Flavor {
  dev,
  hml,
  prod,
}

class F {
  static Flavor? appFlavor;
  static String get name => appFlavor?.name ?? '';

  static String get title {
    const appTitle = 'Financial Situation Track';

    switch (appFlavor) {
      case Flavor.dev:
        return '$appTitle dev';
      case Flavor.hml:
        return '$appTitle hml';
      case Flavor.prod:
        return '$appTitle prod';
      default:
        return appTitle;
    }
  }
}
