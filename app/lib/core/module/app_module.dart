import 'package:external_dependencies/external_dependencies.dart';

import '../../presentation/presentation.dart';

class Routes {
  static String get _source => '/';
  static String get home => _source;
  static String get result => '/result';
}

class AppModule {
  static List<GoRoute> get routes => [
        GoRoute(
          name: 'home',
          path: Routes.home,
          builder: (context, state) => HomePage(),
        ),
        GoRoute(
          name: 'result',
          path: Routes.result,
          builder: (context, state) => const ResultPage(),
        ),
      ];
}
