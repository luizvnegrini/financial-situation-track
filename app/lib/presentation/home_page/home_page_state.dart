import 'package:financial_situation_track/domain/entities/score_result.dart';

import '../base/viewmodel.dart';

abstract class IHomePageState extends ViewModelState {
  const IHomePageState();

  abstract final bool isLoading;
  abstract final String errorMessage;
  abstract final ScoreResult? result;

  IHomePageState copyWith({
    bool? isLoading,
    String? errorMessage,
    ScoreResult? result,
  });
}

class HomePageState extends IHomePageState {
  const HomePageState({
    this.isLoading = false,
    this.errorMessage = '',
    this.result,
  });

  factory HomePageState.initial() => const HomePageState();

  @override
  final bool isLoading;
  @override
  final String errorMessage;
  @override
  final ScoreResult? result;

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
      ];

  @override
  IHomePageState copyWith({
    isLoading,
    errorMessage,
    result,
  }) =>
      HomePageState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        result: result ?? this.result,
      );
}
