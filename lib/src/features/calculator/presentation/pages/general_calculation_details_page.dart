import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_elevated_button.dart';
import 'package:baliqchi/src/config/components/text_field_components.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/core/util/app_constants.dart';
import 'package:baliqchi/src/core/util/funs.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/update_general_calculation.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/update_general_calculation_body.dart';
import 'package:baliqchi/src/features/calculator/presentation/manager/calculator_bloc.dart';
import 'package:baliqchi/src/features/economic/presentation/pages/widgets/details_economic_list_tile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_input_formatter/money_input_formatter.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:toastification/toastification.dart';

class GeneralCalculationDetailsPage extends StatefulWidget {
  final String id;
  final String pondId;

  const GeneralCalculationDetailsPage(
      {super.key, required this.id, required this.pondId});

  @override
  State<GeneralCalculationDetailsPage> createState() =>
      _GeneralCalculationDetailsPageState();
}

class _GeneralCalculationDetailsPageState
    extends State<GeneralCalculationDetailsPage> {
  late final bloc = context.read<CalculatorBloc>();

  final form = FormGroup({
    'price': FormControl<String>(validators: [Validators.required]),
  });

  FormControl<String> get _price =>
      form.control('price') as FormControl<String>;

  @override
  void initState() {
    super.initState();
    bloc.generalCalculationDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculatorBloc, CalculatorState>(
      listener: (context, state) {
        if (state.isDeleted) {
          toastification.show(
              title: Text(state.deleteGeneralCalculationModel?.message ?? '--'),
              type: ToastificationType.info,
              alignment: Alignment.bottomCenter,
              showProgressBar: false,
              icon: const Icon(Icons.check_circle_outline),
              style: ToastificationStyle.fillColored,
              autoCloseDuration: 3.seconds,
              primaryColor: AppColors.mainGreenColor);
          bloc.generalCalculations(widget.pondId);
          context.pop();
        }
        if (state.isUpdated) {
          bloc.generalCalculationDetails(widget.id);
        }
        if (state.hasError) {
          toastification.show(
              title: Text(
                state.errorMessage,
                style: const TextStyle(fontSize: 16),
              ),
              type: ToastificationType.error,
              alignment: Alignment.bottomCenter,
              showProgressBar: false,
              style: ToastificationStyle.fillColored,
              autoCloseDuration: 8.seconds,
              primaryColor: AppColors.mainRedColor);
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).ozuqaHaqidaMalumotlar),
              actions: [
                IconButton(
                    onPressed: () {
                      bloc.deleteGeneralCalculation(widget.id);
                    },
                    icon: const Icon(
                      CupertinoIcons.delete,
                      color: AppColors.mainRedColor,
                    ))
              ],
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppElevatedButton(
                text: S.of(context).batafsil,
                onClick: () {
                  context.pushNamed(AppRoutes.generalCalculationList.name,
                      pathParameters: {
                        'id': state.generalCalculationDetailsModel?.id ?? ''
                      });
                },
              ),
            ),
            body: state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: AppColors.mainColor2,
                  ))
                : ReactiveForm(
                    formGroup: form,
                    child: BlocBuilder<AppCubit, AppState>(
                      builder: (context, appState) {
                        return SingleChildScrollView(
                          padding: const EdgeInsets.all(16),
                          child: Column(children: [
                            AppContainer(
                              margin: EdgeInsets.zero,
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: CachedNetworkImage(
                                      width: MediaQuery.of(context).size.width,
                                      height: 200,
                                      imageUrl:
                                          "${AppConstants.baseUrl}${state.generalCalculationDetailsModel?.files?.first.path}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  DetailsEconomicListTile(
                                    title: S.of(context).baliqTuri,
                                    currency: appState.lang == 'uz'
                                        ? state.generalCalculationDetailsModel
                                                ?.fishTypeNameUz ??
                                            '--'
                                        : state.generalCalculationDetailsModel
                                                ?.fishTypeNameRu ??
                                            '--',
                                  ),
                                  DetailsEconomicListTile(
                                    title: S.of(context).ozuqaTuri,
                                    currency: appState.lang == 'uz'
                                        ? state.generalCalculationDetailsModel
                                                ?.foodTypeNameUz ??
                                            '--'
                                        : state.generalCalculationDetailsModel
                                                ?.foodTypeNameRu ??
                                            '--',
                                  ),
                                  DetailsEconomicListTile(
                                    title: S.of(context).talabQilinganOvqatKg,
                                    currency: state
                                            .generalCalculationDetailsModel
                                            ?.requiredFood
                                            ?.toStringAsFixed(2) ??
                                        '--',
                                  ),
                                  DetailsEconomicListTile(
                                    title: S
                                        .of(context)
                                        .tavsiyaEtilganSuvHaroratiC,
                                    currency: state
                                            .generalCalculationDetailsModel
                                            ?.temperature
                                            .toString() ??
                                        '--',
                                  ),
                                  DetailsEconomicListTile(
                                    title: S.of(context).taxminiyOsishiKun,
                                    currency: state
                                            .generalCalculationDetailsModel
                                            ?.estimatedGrowth
                                            ?.toStringAsFixed(2) ??
                                        '--',
                                  ),
                                  DetailsEconomicListTile(
                                    title: S.of(context).taxminQilinganKunlar,
                                    currency: state
                                            .generalCalculationDetailsModel
                                            ?.growthPeriod
                                            ?.toStringAsFixed(0) ??
                                        '--',
                                  ),
                                  DetailsEconomicListTile(
                                    title:
                                        S.of(context).talabQilinganOzuqakunKg,
                                    currency: ((state
                                                    .generalCalculationDetailsModel
                                                    ?.requiredFood ??
                                                0) /
                                            (state.generalCalculationDetailsModel
                                                    ?.growthPeriod ??
                                                1))
                                        .toStringAsFixed(2),
                                  ),
                                  DetailsEconomicListTile(
                                    title: S.of(context).ummumiyHarajatlar,
                                    currency: getCurrencySymbol(state
                                            .generalCalculationDetailsModel
                                            ?.totalPrice ??
                                        0),
                                  ),
                                  DetailsEconomicListTile(
                                    title: S
                                        .of(context)
                                        .baliqVazniningOsishOraligi,
                                    currency: state
                                            .generalCalculationDetailsModel
                                            ?.weightInterval ??
                                        '--',
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            AppContainer(
                              margin: EdgeInsets.zero,
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          S.of(context).ozuqaNarxiSom,
                                          style: CustomTextStyle.h16M,
                                        ),
                                      ),
                                      Text(
                                        getCurrencySymbol(state
                                                .generalCalculationDetailsModel
                                                ?.foodPrice ??
                                            0),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.utilityBillsColor),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ReactiveTextField(
                                          style: CustomTextStyle.h16M,
                                          formControl: _price,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            errorStyle:
                                                const TextStyle(height: 0.001),
                                            errorText: null,
                                            hintText:
                                                S.of(context).ozuqaNarxiSom,
                                            hintStyle: CustomTextStyle.hint,
                                            border: appTextFiledBorder(),
                                            enabledBorder: appTextFiledBorder(),
                                            disabledBorder:
                                                appTextFiledBorder(),
                                            focusedBorder: appTextFiledBorder(),
                                            errorBorder:
                                                appTextFiledErrorBorder(),
                                          ),
                                          validationMessages: {
                                            'required': (error) => '',
                                          },
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            MoneyInputFormatter()
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      ReactiveFormConsumer(
                                          builder: (context, form, child) {
                                        return SizedBox(
                                          height: 48,
                                          width: 56,
                                          child: IconButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.mainColor2,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              onPressed: () {
                                                if (form.valid) {
                                                  bloc.updateGeneralCalculation(
                                                      UpdateGeneralCalculation(
                                                          id: widget.id,
                                                          body: UpdateGeneralCalculationBody(
                                                              foodPrice: _price
                                                                  .value
                                                                  ?.replaceAll(
                                                                      ' ',
                                                                      ''))));
                                                } else {
                                                  form.markAllAsTouched();
                                                }
                                              },
                                              icon: const Icon(
                                                Icons.currency_exchange,
                                                color: Colors.white,
                                              )),
                                        );
                                      })
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ]),
                        );
                      },
                    ),
                  ));
      },
    );
  }
}
