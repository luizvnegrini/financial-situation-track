import 'package:design_system/design_system.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:financial_situation_track/presentation/home_page/home_page_state.dart';
import 'package:financial_situation_track/presentation/home_page/home_page_viewmodel.dart';
import 'package:financial_situation_track/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../core/core.dart';
import 'home_page_providers.dart';

class HomePage extends HookConsumerWidget {
  HomePage({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextStyle labelStyle = const TextStyle(
    fontFamily: 'Work Sans',
    package: 'design_system',
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget? loadingWidget;
    final annualIncomingController = useTextEditingController();
    final monthlyCostsIncomingController = useTextEditingController();
    final annualIncomingFocusNode = useFocusNode();
    final monthlyCostsIncomingFocusNode = useFocusNode();
    final isFormValid = useState(false);

    return HookConsumer(
      builder: (contxt, ref, __) {
        final vm = readHomeViewModel(ref);
        final state = useHomeState(ref);

        _verifyResultAndNavigate(context, state, () {
          vm.clearResult();
          annualIncomingController.clear();
          monthlyCostsIncomingController.clear();
        });
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
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: loadingWidget ??
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VGap.xxxs(),
                      const PageHeaderDescription(
                        text: '''Let's find out your ''',
                        boldText: 'financial wellness score.',
                      ),
                      const VGap.xxs(),
                      Card(
                        color: Colors.white,
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(kSpacingXXXS),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _Description(style: labelStyle),
                              const VGap.xxxs(),
                              Text(
                                'Annual income',
                                style: labelStyle.copyWith(fontSize: 12),
                              ),
                              const VGap.nano(),
                              MoneyTextFormField(
                                focusNode: annualIncomingFocusNode,
                                autofocus: true,
                                controller: annualIncomingController,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context).requestFocus(
                                    monthlyCostsIncomingFocusNode,
                                  );
                                },
                                validator: _validateInput,
                              ),
                              const VGap.xxxs(),
                              Text(
                                'Monthly Costs',
                                style: labelStyle.copyWith(fontSize: 12),
                              ),
                              const VGap.nano(),
                              MoneyTextFormField(
                                focusNode: monthlyCostsIncomingFocusNode,
                                controller: monthlyCostsIncomingController,
                                onFieldSubmitted: (_) => _validateForm(
                                  vm,
                                  annualIncomingController,
                                  monthlyCostsIncomingController,
                                ),
                                validator: _validateInput,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const VGap.xxxs(),
                      Button(
                        enabled: isFormValid.value,
                        onPressed: () => _validateForm(
                          vm,
                          annualIncomingController,
                          monthlyCostsIncomingController,
                        ),
                        label: 'Continue',
                      ),
                      const VGap.sm(),
                      const EncryptionDisclaimer(),
                    ],
                  ),
                ),
          ),
        );
      },
    );
  }

  void _validateForm(
      IHomePageViewModel vm,
      TextEditingController annualIncomingController,
      TextEditingController monthlyCostsIncomingController) {
    if (_formKey.currentState?.validate() == true) {
      vm.getScore(
        annualIncome: annualIncomingController.text,
        monthlyCosts: monthlyCostsIncomingController.text,
      );
    }
  }

  void _verifyResultAndNavigate(
    BuildContext context,
    HomePageState state,
    VoidCallback onNavigate,
  ) {
    useEffect(() {
      if (state.result != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.go('/${Routes.result}', extra: state.result);
          onNavigate();
        });
      }
      return;
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

class _Description extends StatelessWidget {
  final TextStyle? style;

  const _Description({this.style});

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
            const VGap.xxxs(),
            Text(
              'Financial wellness test',
              style: style?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(30, 42, 50, 1),
              ),
            ),
            Text(
              'Enter your financial information below',
              style: style?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(
                  112,
                  135,
                  151,
                  1,
                ),
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
