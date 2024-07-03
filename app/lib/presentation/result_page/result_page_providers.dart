//vm's

import 'package:external_dependencies/external_dependencies.dart';
import 'package:financial_situation_track/presentation/result_page/result_page_state.dart';

import 'result_page_viewmodel.dart';

//vm's
IResultPageViewModel readResultViewModel(WidgetRef ref) =>
    ref.read(resultPageViewModel.notifier);

//states
IResultPageState useResultState(WidgetRef ref) =>
    ref.watch(resultPageViewModel);
