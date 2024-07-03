import '../base/viewmodel.dart';

abstract class IResultPageState extends ViewModelState {
  const IResultPageState();

  abstract final bool isLoading;

  IResultPageState copyWith({
    bool? isLoading,
  });
}

class ResultPageState extends IResultPageState {
  const ResultPageState({
    this.isLoading = true,
  });

  factory ResultPageState.initial() => const ResultPageState();

  @override
  final bool isLoading;

  @override
  List<Object?> get props => [
        isLoading,
      ];

  @override
  IResultPageState copyWith({
    isLoading,
  }) =>
      ResultPageState(
        isLoading: isLoading ?? this.isLoading,
      );
}
