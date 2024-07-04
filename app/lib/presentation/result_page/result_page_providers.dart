//vm's

import 'package:external_dependencies/external_dependencies.dart';
import 'package:financial_situation_track/presentation/result_page/result_page_state.dart';

import '../../domain/domain.dart';
import 'result_page_viewmodel.dart';

//vm's
ResultPageViewModel readResultViewModel(WidgetRef ref, ScoreResult result) =>
    ref.read(resultPageViewModel(result).notifier);

//states
ResultPageState useResultState(WidgetRef ref, ScoreResult result) => ref.watch(
      resultPageViewModel(result),
    );
