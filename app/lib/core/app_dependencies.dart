abstract class IAppDependencies {}

class AppDependencies implements IAppDependencies {
  AppDependencies();

  static Future<IAppDependencies> load() async {
    return AppDependencies();
  }
}
