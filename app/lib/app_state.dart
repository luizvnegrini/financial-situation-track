import 'core/core.dart';

abstract class AppState {
  abstract final AppDependencies appDependencies;
}

class AppStateImpl extends AppState {
  AppStateImpl({
    required this.appDependencies,
  });

  @override
  final AppDependencies appDependencies;
}
