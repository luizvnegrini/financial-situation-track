import '../../domain/domain.dart';
import '../base/viewmodel.dart';

abstract class ResultPageState extends ViewModelState {
  const ResultPageState();

  abstract final ScoreResult result;

  ResultPageState copyWith({
    ScoreResult? result,
  });
}

class ResultPageStateImpl extends ResultPageState {
  const ResultPageStateImpl({
    required this.result,
  });

  factory ResultPageStateImpl.initial({
    required ScoreResult result,
  }) =>
      ResultPageStateImpl(
        result: result,
      );

  @override
  final ScoreResult result;

  @override
  List<Object?> get props => [
        result,
      ];

  @override
  ResultPageState copyWith({
    result,
  }) =>
      ResultPageStateImpl(
        result: result ?? this.result,
      );
}
