import 'package:design_system/design_system.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:financial_situation_track/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../../domain/domain.dart';
import 'home_page_providers.dart';

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
          backgroundColor: Colors.white,
          body: loadingWidget ??
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const PageHeaderDescription(
                      text: '''Let's find out your ''',
                      boldText: 'financial wellness score.',
                    ),
                    const SizedBox(height: 24),
                    Card(
                      color: Colors.white,
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _Description(),
                            const SizedBox(height: 16),

                            ///TODO: improve UI doing transaction between textformfields
                            ///when user click in "done"
                            const Text('Annual income'),
                            const SizedBox(height: 7),
                            MoneyTextFormField(
                              autofocus: true,
                              controller: annualIncomingController,
                              validator: _validateInput,
                            ),
                            const SizedBox(height: 16),
                            const Text('Monthly Costs'),
                            const SizedBox(height: 7),
                            MoneyTextFormField(
                              controller: monthlyCostsIncomingController,
                              validator: _validateInput,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Button(
                      enabled: isFormValid.value,
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          vm
                              .getScore(
                                annualIncome: annualIncomingController.text,
                                monthlyCosts:
                                    monthlyCostsIncomingController.text,
                              )
                              .then(
                                (_) => _verifyResultAndNavigate(
                                  context,
                                  state.result,
                                ),
                              );
                        }
                      },
                      child: const Text('Continue'),
                    ),
                    const SizedBox(height: 36),
                    const EncryptionDisclaimer(),
                  ],
                ),
              ),
        );
      },
    );
  }

  void _verifyResultAndNavigate(BuildContext context, ScoreResult? result) {
    if (result != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go(Routes.result, extra: result);
      });
    }
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

class _Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/circular-logo.png',
              package: 'design_system',
              height: 48,
            ),
            const SizedBox(height: 16),
            const Text(
              'Financial wellness test',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(30, 42, 50, 1),
              ),
            ),
            const Text(
              'Enter your financial information below',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(112, 135, 151, 1),
              ),
            ),
          ],
        ),
      ),
    );
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
