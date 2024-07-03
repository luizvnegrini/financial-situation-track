import 'core/core.dart';

abstract class IAppState {
  abstract final IAppDependencies appDependencies;
}

class AppState extends IAppState {
  AppState({
    required this.appDependencies,
  });

  @override
  final IAppDependencies appDependencies;
}
