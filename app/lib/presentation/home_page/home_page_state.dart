import 'package:financial_situation_track/domain/entities/score_result.dart';

import '../base/viewmodel.dart';

abstract class HomePageState extends ViewModelState {
  const HomePageState();

  abstract final bool isLoading;
  abstract final String errorMessage;
  abstract final ScoreResult? result;

  HomePageState copyWith({
    bool? isLoading,
    String? errorMessage,
    ScoreResult? result,
  });
}

class HomePageStateImpl extends HomePageState {
  const HomePageStateImpl({
    this.isLoading = false,
    this.errorMessage = '',
    this.result,
  });

  factory HomePageStateImpl.initial() => const HomePageStateImpl();

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
        result,
      ];

  @override
  HomePageState copyWith({
    isLoading,
    errorMessage,
    result,
  }) =>
      HomePageStateImpl(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        result: result ?? this.result,
      );
}
