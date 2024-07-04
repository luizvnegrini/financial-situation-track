import 'package:external_dependencies/external_dependencies.dart';

import '../../domain/domain.dart';
import '../../presentation/presentation.dart';

class Routes {
  static String get _source => '/';
  static String get home => _source;
  static String get result => 'result';
}

class AppModule {
  static List<GoRoute> get routes => [
        GoRoute(
          name: 'home',
          path: Routes.home,
          builder: (context, state) => HomePage(),
          routes: [
            GoRoute(
              name: 'result',
              path: Routes.result,
              builder: (context, state) {
                final result = state.extra as ScoreResult;
                return ResultPage(result: result);
              },
            ),
          ],
        ),
      ];
}
