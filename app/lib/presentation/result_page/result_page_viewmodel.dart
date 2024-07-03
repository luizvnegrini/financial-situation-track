import 'package:external_dependencies/external_dependencies.dart';

import '../base/viewmodel.dart';
import 'result_page_state.dart';

final resultPageViewModel =
    StateNotifierProvider.autoDispose<IResultPageViewModel, IResultPageState>(
  (ref) => ResultPageViewModel(),
);

abstract class IResultPageViewModel extends ViewModel<IResultPageState> {
  IResultPageViewModel(super.state);
}

class ResultPageViewModel extends IResultPageViewModel {
  ResultPageViewModel() : super(ResultPageState.initial());
}
