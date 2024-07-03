import 'package:external_dependencies/external_dependencies.dart';

import '../base/viewmodel.dart';
import 'home_page_state.dart';

final homePageViewModel =
    StateNotifierProvider.autoDispose<IHomePageViewModel, IHomePageState>(
  (ref) => HomePageViewModel(),
);

abstract class IHomePageViewModel extends ViewModel<IHomePageState> {
  IHomePageViewModel(super.state);

  Future<void> calculate();
}

class HomePageViewModel extends IHomePageViewModel {
  HomePageViewModel() : super(HomePageState.initial());

  @override
  Future<void> calculate() async {
    state = state.copyWith(isLoading: true);

    ///TODO: call usecase here

    state = state.copyWith(isLoading: false);
  }
}
