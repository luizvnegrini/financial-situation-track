import 'package:financial_situation_track/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFinancialData extends Mock implements FinancialData {}

void main() {
  group(
    'CalculateScoreImpl',
    () {
      final financialData = MockFinancialData();
      final calculateScore = CalculateScoreImpl();

      group(
          'should return healthy when cost percentage is less than or equal to 0.25',
          () {
        test(
          '100000 annual income and 1000 monthly costs should return healthy',
          () {
            when(() => financialData.annualIncome).thenReturn(100000);
            when(() => financialData.monthlyCosts).thenReturn(1000);

            final result = calculateScore.call(financialData);

            expect(result, ScoreResult.healthy);
          },
        );

        test(
          '200000 annual income and 2000 monthly costs should return healthy',
          () {
            when(() => financialData.annualIncome).thenReturn(200000);
            when(() => financialData.monthlyCosts).thenReturn(2000);

            final result = calculateScore.call(financialData);

            expect(result, ScoreResult.healthy);
          },
        );
      });

      group(
        'should return average when cost percentage is between 0.25 and 0.75',
        () {
          test(
            '100000 annual income and 2000 monthly costs should return average',
            () {
              when(() => financialData.annualIncome).thenReturn(100000);
              when(() => financialData.monthlyCosts).thenReturn(2000);

              final result = calculateScore.call(financialData);

              expect(result, ScoreResult.average);
            },
          );

          test(
            '210000 annual income and 5000 monthly costs should return average',
            () {
              when(() => financialData.annualIncome).thenReturn(210000);
              when(() => financialData.monthlyCosts).thenReturn(5000);

              final result = calculateScore.call(financialData);

              expect(result, ScoreResult.average);
            },
          );
        },
      );

      group(
        'should return unhealthy when cost percentage is greater than 0.75',
        () {
          test(
            '10000 annual income and 2000 monthly costs should return unhealthy',
            () {
              when(() => financialData.annualIncome).thenReturn(10000);
              when(() => financialData.monthlyCosts).thenReturn(2000);

              final result = calculateScore.call(financialData);

              expect(result, ScoreResult.unhealthy);
            },
          );

          test(
            '10000 annual income and 1500 monthly costs should return unhealthy',
            () {
              when(() => financialData.annualIncome).thenReturn(10000);
              when(() => financialData.monthlyCosts).thenReturn(1500);

              final result = calculateScore.call(financialData);

              expect(result, ScoreResult.unhealthy);
            },
          );
        },
      );
    },
  );
}
