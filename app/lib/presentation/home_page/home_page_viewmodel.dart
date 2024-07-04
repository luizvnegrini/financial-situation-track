import 'package:external_dependencies/external_dependencies.dart';
import 'package:financial_situation_track/utils/utils.dart';

import '../../domain/domain.dart';
import '../base/viewmodel.dart';
import '../presentation.dart';
import 'home_page_state.dart';

final homePageViewModel =
    StateNotifierProvider.autoDispose<HomePageViewModel, HomePageState>(
  (ref) => HomePageViewModelImpl(
    calculateScore: ref.read(calculateScore),
  ),
);

abstract class HomePageViewModel extends ViewModel<HomePageState> {
  HomePageViewModel(super.state);

  abstract final CalculateScore calculateScore;
  void clearResult();

  Future<void> getScore({
    required String annualIncome,
    required String monthlyCosts,
  });
}

class HomePageViewModelImpl extends HomePageViewModel {
  @override
  final CalculateScore calculateScore;

  HomePageViewModelImpl({
    required this.calculateScore,
  }) : super(HomePageStateImpl.initial());

  @override
  Future<void> getScore({
    required String annualIncome,
    required String monthlyCosts,
  }) async {
    state = state.copyWith(isLoading: true);

    await Future.delayed(const Duration(seconds: 1));
    final result = calculateScore(
      FinancialData(
        annualIncome: annualIncome.asNum,
        monthlyCosts: monthlyCosts.asNum,
      ),
    );

    state = state.copyWith(
      isLoading: false,
      result: result,
    );
  }

  @override
  void clearResult() {
    state = HomePageStateImpl.initial();
  }
}
