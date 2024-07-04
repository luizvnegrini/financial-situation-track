import 'package:external_dependencies/external_dependencies.dart';

import '../../core/core.dart';
import '../entities/entities.dart';

abstract class CalculateScore {
  Either<Failure, ScoreResult> call(FinancialData data);
}

class CalculateScoreImpl implements CalculateScore {
  @override
  Either<Failure, ScoreResult> call(FinancialData data) {
    try {
      //throw Exception();

      late ScoreResult result;
      final annualNetIncome = data.annualIncome - (data.annualIncome * 0.08);
      final double annualCosts = data.monthlyCosts * 12;
      final costPercentage = annualCosts / annualNetIncome;

      if (costPercentage <= 0.25) {
        result = ScoreResult.healthy;
      } else if (costPercentage <= 0.75) {
        result = ScoreResult.average;
      } else {
        result = ScoreResult.unhealthy;
      }

      return Right(result);
    } catch (e) {
      return Left(Failure(type: ExceptionType.unexpected));
    }
  }
}
