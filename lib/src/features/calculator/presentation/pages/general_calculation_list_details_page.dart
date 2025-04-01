import 'dart:convert';

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
import 'package:baliqchi/src/features/calculator/data/models/general_nutritional_info_model.dart';
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

class GeneralCalculationListDetailsPage extends StatefulWidget {
  final String id;

  const GeneralCalculationListDetailsPage({super.key, required this.id});

  @override
  State<GeneralCalculationListDetailsPage> createState() =>
      _GeneralCalculationListDetailsPageState();
}

class _GeneralCalculationListDetailsPageState
    extends State<GeneralCalculationListDetailsPage> {
  late final bloc = context.read<CalculatorBloc>();

  @override
  void initState() {
    super.initState();
    bloc.generalCalculationListDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculatorBloc, CalculatorState>(
      listener: (context, state) {
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
            ),
            body: state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: AppColors.mainColor2,
                  ))
                : BlocBuilder<AppCubit, AppState>(
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
                              "${AppConstants.baseUrl}${state.generalCalculationListDetailsModel?.files?.first.path}",
                              fit: BoxFit.cover,
                            ),
                          ),
                          DetailsEconomicListTile(
                            title: S.of(context).baliqTuri,
                            currency: appState.lang == 'uz'
                                ? state.generalCalculationListDetailsModel
                                ?.fishTypeNameUz ??
                                '--'
                                : state.generalCalculationListDetailsModel
                                ?.fishTypeNameRu ??
                                '--',
                          ),
                          DetailsEconomicListTile(
                            title: S.of(context).ozuqaTuri,
                            currency: appState.lang == 'uz'
                                ? state.generalCalculationListDetailsModel
                                ?.foodTypeNameUz ??
                                '--'
                                : state.generalCalculationListDetailsModel
                                ?.foodTypeNameRu ??
                                '--',
                          ),
                          DetailsEconomicListTile(
                            title: S.of(context).talabQilinganOvqatKg,
                            currency: state
                                .generalCalculationListDetailsModel
                                ?.requiredFood
                                ?.toStringAsFixed(2) ??
                                '--',
                          ),
                          DetailsEconomicListTile(
                            title: S
                                .of(context)
                                .tavsiyaEtilganSuvHaroratiC,
                            currency: state
                                .generalCalculationListDetailsModel
                                ?.temperature
                                .toString() ??
                                '--',
                          ),
                          DetailsEconomicListTile(
                            title: S.of(context).taxminiyOsishiKun,
                            currency: state
                                .generalCalculationListDetailsModel
                                ?.estimatedGrowth
                                ?.toStringAsFixed(2) ??
                                '--',
                          ),
                          DetailsEconomicListTile(
                            title: S.of(context).taxminQilinganKunlar,
                            currency: state
                                .generalCalculationListDetailsModel
                                ?.growthPeriod
                                ?.toStringAsFixed(0) ??
                                '--',
                          ),
                          DetailsEconomicListTile(
                            title:
                            S.of(context).talabQilinganOzuqakunKg,
                            currency: ((state
                                .generalCalculationListDetailsModel
                                ?.requiredFood ??
                                0) /
                                (state.generalCalculationListDetailsModel
                                    ?.growthPeriod ??
                                    1))
                                .toStringAsFixed(2),
                          ),
                          DetailsEconomicListTile(
                            title: S.of(context).ummumiyHarajatlar,
                            currency: getCurrencySymbol(state
                                .generalCalculationListDetailsModel
                                ?.totalPrice ??
                                0),
                          ),
                          DetailsEconomicListTile(
                            title: S
                                .of(context)
                                .baliqVazniningOsishOraligi,
                            currency: state
                                .generalCalculationListDetailsModel
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
                                    .generalCalculationListDetailsModel
                                    ?.foodPrice ??
                                    0),
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.utilityBillsColor),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ]),
                );
              },
            ),
        );
      },
    );
  }
}
