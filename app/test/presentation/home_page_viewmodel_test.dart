import 'package:external_dependencies/external_dependencies.dart';
import 'package:financial_situation_track/domain/domain.dart';
import 'package:financial_situation_track/presentation/home_page/home_page_state.dart';
import 'package:financial_situation_track/presentation/home_page/home_page_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCalculateScore extends Mock implements CalculateScore {}

void main() {
  late ProviderContainer container;
  late StateNotifierProvider<HomePageViewModelImpl, HomePageState>
      homePageViewModelProvider;
  late MockCalculateScore mockCalculateScore;

  setUp(() {
    mockCalculateScore = MockCalculateScore();

    container = ProviderContainer();
    homePageViewModelProvider =
        StateNotifierProvider<HomePageViewModelImpl, HomePageState>(
      (ref) => HomePageViewModelImpl(
        calculateScore: mockCalculateScore,
      ),
    );

    container
        .read(homePageViewModelProvider.notifier); // Initialize the provider
  });

  tearDown(() {
    container.dispose();
  });

  group('HomePageViewModel Tests', () {
    test('initial state is correct', () {
      final homePageViewModel =
          container.read(homePageViewModelProvider.notifier);
      expect(homePageViewModel.state, HomePageStateImpl.initial());
    });

    test('getScore sets the state correctly', () async {
      final homePageViewModel =
          container.read(homePageViewModelProvider.notifier);
      const financialData = FinancialData(
        annualIncome: 50000,
        monthlyCosts: 2000,
      );

      const scoreResult = ScoreResult.healthy;

      when(() => mockCalculateScore(financialData)).thenReturn(scoreResult);

      await homePageViewModel.getScore(
        annualIncome: '50000',
        monthlyCosts: '2000',
      );

      expect(homePageViewModel.state.isLoading, false);
      expect(homePageViewModel.state.result, scoreResult);
    });

    test('clearResult sets the state to initial', () {
      final homePageViewModel =
          container.read(homePageViewModelProvider.notifier);
      homePageViewModel.clearResult();
      expect(homePageViewModel.state, HomePageStateImpl.initial());
    });
  });
}
