import 'package:external_dependencies/external_dependencies.dart';

import '../../domain/domain.dart';
import '../base/viewmodel.dart';
import 'result_page_state.dart';

final resultPageViewModel = StateNotifierProvider.family
    .autoDispose<ResultPageViewModel, ResultPageState, ScoreResult>(
  (ref, result) => ResultPageViewModelImpl(
    result: result,
  ),
);

abstract class ResultPageViewModel extends ViewModel<ResultPageState> {
  ResultPageViewModel(super.state);
}

class ResultPageViewModelImpl extends ResultPageViewModel {
  ResultPageViewModelImpl({
    required ScoreResult result,
  }) : super(ResultPageStateImpl.initial(
          result: result,
        ));
}
