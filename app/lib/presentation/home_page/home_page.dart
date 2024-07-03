import 'package:design_system/design_system.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';

import 'home_page_providers.dart';

class HomePage extends HookConsumerWidget {
  HomePage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HookConsumer(
      builder: (_, ref, __) {
        Widget? loadingWidget;
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
                          ///TODO: call vm and calculate
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
    final number = int.tryParse(value);
    if (number == null || number <= 0) {
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
