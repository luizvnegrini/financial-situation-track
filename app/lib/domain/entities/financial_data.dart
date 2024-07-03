import 'package:external_dependencies/external_dependencies.dart';

class FinancialData extends Equatable {
  final num annualIncome;
  final num monthlyCosts;

  const FinancialData({
    required this.annualIncome,
    required this.monthlyCosts,
  });

  @override
  List<Object?> get props => [annualIncome, monthlyCosts];
}
