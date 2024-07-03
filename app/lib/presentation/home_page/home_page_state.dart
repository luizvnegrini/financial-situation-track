import '../base/viewmodel.dart';

abstract class IHomePageState extends ViewModelState {
  const IHomePageState();

  abstract final bool isLoading;
  abstract final String errorMessage;

  IHomePageState copyWith({
    bool? isLoading,
    String? errorMessage,
  });
}

class HomePageState extends IHomePageState {
  const HomePageState({
    this.isLoading = true,
    this.errorMessage = '',
  });

  factory HomePageState.initial() => const HomePageState();

  @override
  final bool isLoading;
  @override
  final String errorMessage;

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
      ];

  @override
  IHomePageState copyWith({
    isLoading,
    errorMessage,
  }) =>
      HomePageState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
