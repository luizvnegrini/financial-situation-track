import '../entities/entities.dart';

abstract class CalculateScore {
  ScoreResult call(FinancialData data);
}

class CalculateScoreImpl implements CalculateScore {
  @override
  ScoreResult call(FinancialData data) {
    ///TODO: put inside try catch block and handle possible error's
    final annualNetIncome = data.annualIncome - (data.annualIncome * 0.08);
    final double annualCosts = data.monthlyCosts * 12;
    final costPercentage = annualCosts / annualNetIncome;

    if (costPercentage <= 0.25) {
      return ScoreResult.healthy;
    } else if (costPercentage <= 0.75) {
      return ScoreResult.average;
    } else {
      return ScoreResult.unhealthy;
    }
  }
}
