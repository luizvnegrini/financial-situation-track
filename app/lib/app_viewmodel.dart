import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';

import 'app_state.dart';
import 'core/core.dart';

abstract class IAppViewModel extends ValueNotifier<AsyncValue<AppState>> {
  IAppViewModel(super.value);

  Future<void> loadDependencies();
}

class AppViewModel extends IAppViewModel {
  AppViewModel() : super(const AsyncValue.loading());
  var _hasRequestedLoading = false;

  @override
  Future<void> loadDependencies() async {
    if (_hasRequestedLoading) {
      return;
    }
    _hasRequestedLoading = true;

    final splashMinDuration = Future<dynamic>.delayed(
      const Duration(seconds: 3),
    );

    final futureResults = await Future.wait<dynamic>([
      splashMinDuration,
      AppDependenciesImpl.load(),
    ]);

    value = AsyncValue.data(
      AppStateImpl(
        appDependencies: futureResults[1],
      ),
    );
  }
}
