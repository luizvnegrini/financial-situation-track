import '../domain/domain.dart';

abstract class AppDependencies {
  //usecases
  abstract final CalculateScore calculateScore;
}

class AppDependenciesImpl implements AppDependencies {
  //usecases
  @override
  final CalculateScore calculateScore;

  AppDependenciesImpl({
    required this.calculateScore,
  });

  static Future<AppDependencies> load() async {
    return AppDependenciesImpl(
      calculateScore: CalculateScoreImpl(),
    );
  }
}
