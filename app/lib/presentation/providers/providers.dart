import 'package:external_dependencies/external_dependencies.dart';

import '../../domain/domain.dart';

final calculateScore = Provider.autoDispose<CalculateScore>((_) {
  throw UnimplementedError('calculateScore usecase must be overridden');
});
