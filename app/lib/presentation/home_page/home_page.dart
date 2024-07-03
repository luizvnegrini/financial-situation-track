import 'package:design_system/design_system.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:financial_situation_track/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../core/core.dart';
import 'home_page_providers.dart';
import 'home_page_state.dart';

class HomePage extends HookConsumerWidget {
  HomePage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HookConsumer(
      builder: (_, ref, __) {
        Widget? loadingWidget;
        final vm = readHomeViewModel(ref);
        final annualIncomingController = useTextEditingController();
        final monthlyCostsIncomingController = useTextEditingController();
        final state = useHomeState(ref);
        final isFormValid = useState(false);

        _configureValidatorsListeners(
          annualIncomingController,
          monthlyCostsIncomingController,
          isFormValid,
        );

        if (state.isLoading) {
          loadingWidget = const Center(child: CircularProgressIndicator());
        }

        return ScaffoldWidget(
          appBar: AppBar(
            title: const Text('Kalshi logo here'),
          ),
          body: loadingWidget ??
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    MoneyTextFormField(
                      autofocus: true,
                      controller: annualIncomingController,
                      validator: _validateInput,
                    ),
                    MoneyTextFormField(
                      controller: monthlyCostsIncomingController,
                      validator: _validateInput,
                    ),
                    Button(
                      enabled: isFormValid.value,
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          vm.getScore(
                            annualIncome: annualIncomingController.text,
                            monthlyCosts: monthlyCostsIncomingController.text,
                          );
                        }
                      },
                      child: const Text('Continue'),
                    ),
                  ],
                ),
              ),
        );
      },
    );
  }

  void _listenResultAndNavigate(
    BuildContext context,
    IHomePageState state,
  ) {
    useEffect(() {
      if (state.result != null) {
        context.go(Routes.result, extra: state.result);
      }
      return null;
    }, [state.result]);
  }

  void _configureValidatorsListeners(
    TextEditingController annualIncomingController,
    TextEditingController monthlyCostsIncomingController,
    ValueNotifier<bool> isFormValid,
  ) {
    useEffect(
      () {
        void listener() {
          final isAnnualIncomingValid = _validateInput(
                annualIncomingController.text,
              ) ==
              null;
          final isMonthlyCostsValid = _validateInput(
                monthlyCostsIncomingController.text,
              ) ==
              null;

          isFormValid.value = isAnnualIncomingValid && isMonthlyCostsValid;
        }

        annualIncomingController.addListener(listener);
        monthlyCostsIncomingController.addListener(listener);

        return () {
          annualIncomingController.removeListener(listener);
          monthlyCostsIncomingController.removeListener(listener);
        };
      },
      [annualIncomingController, monthlyCostsIncomingController],
    );
  }

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a number';
    }

    if (value.asNum <= 0) {
      return 'Please enter a number greater than zero';
    }

    return null;
  }
}

class ErrorWidget extends StatelessWidget {
  final VoidCallback onTryAgain;

  const ErrorWidget({super.key, required this.onTryAgain});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onTryAgain,
        child: const Text('Try again'),
      ),
    );
  }
}
