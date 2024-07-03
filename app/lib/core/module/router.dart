import 'package:external_dependencies/external_dependencies.dart';

import 'app_module.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    ...AppModule.routes,
  ],
);
