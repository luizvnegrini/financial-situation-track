//vm's

import 'package:external_dependencies/external_dependencies.dart';
import 'package:financial_situation_track/presentation/home_page/home_page_state.dart';

import 'home_page_viewmodel.dart';

//vm's
IHomePageViewModel readHomeViewModel(WidgetRef ref) =>
    ref.read(homePageViewModel.notifier);

//states
HomePageState useHomeState(WidgetRef ref) => ref.watch(homePageViewModel);
