import 'dart:convert';

import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_elevated_button.dart';
import 'package:baliqchi/src/config/components/app_row.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/core/util/app_constants.dart';
import 'package:baliqchi/src/core/util/funs.dart';
import 'package:baliqchi/src/features/calculator/data/models/general_calculations_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/pond_model.dart';
import 'package:baliqchi/src/features/calculator/presentation/manager/calculator_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class GeneralCalculationsPage extends StatefulWidget {
  final String pondJson;

  const GeneralCalculationsPage({super.key, required this.pondJson});

  @override
  State<GeneralCalculationsPage> createState() =>
      _GeneralCalculationsPageState();
}

class _GeneralCalculationsPageState extends State<GeneralCalculationsPage> {
  late final bloc = context.read<CalculatorBloc>();
  PondModel? pondModel;

  @override
  void initState() {
    super.initState();
    pondModel = PondModel.fromJson(jsonDecode(widget.pondJson));
    bloc.generalCalculations(pondModel?.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return BlocBuilder<CalculatorBloc, CalculatorState>(
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(
                  title: Text(S.of(context).ozuqaHaqidaMalumotlar),
                ),
                bottomNavigationBar: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppElevatedButton(
                    text: S.of(context).umumiyOzuqaniHisoblash,
                    onClick: () {
                      context.pushNamed(
                          AppRoutes.createGeneralCalculations.name,
                          pathParameters: {'pond': jsonEncode(pondModel)});
                    },
                  ),
                ),
                body: state.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.mainColor2,
                      ))
                    : state.generalCalculations.isEmpty
                        ? Center(
                            child: Text(
                              S.of(context).malumotTopilmadi,
                              style: const TextStyle(
                                color: Color(0xFF0F1728),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : LazyLoadScrollView(
                            isLoading: state.isPaging,
                            scrollOffset: 300,
                            onEndOfPage: () =>bloc.pagingGeneralCalculations(pondModel?.id??''),
                            child: ListView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              itemCount: state.generalCalculations.length +
                                  (state.isPaging ? 1 : 0),
                              itemBuilder: (context, index) =>
                                  index == state.generalCalculations.length
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : buildNewsItem(
                                          context,
                                          state.generalCalculations[index],
                                          index,appState.lang),
                            ),
                          )
            );
          },
        );
      },
    );
  }

  Widget buildNewsItem(
      BuildContext context, GeneralCalculation? model, int index,String lang) {
    return AppContainer(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      onTab: () {
        context.pushNamed(AppRoutes.generalCalculationDetails.name,
            pathParameters: {
              'id': model?.id ?? '',
              'pondId': pondModel?.id ?? ''
            });
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: CachedNetworkImage(
              width: 80,
              imageUrl: "${AppConstants.baseUrl}${model?.files?.first.path}",
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppRow(
                  text1: lang=='uz'? model?.fishTypeNameUz ?? '--':model?.fishTypeNameRu ?? '--',
                  text2: model?.weightInterval ?? '--',
                ),
                AppRow(
                  text1: S.of(context).ozuqaTuri,
                  text2: model?.foodTypeNameUz.toString() ?? '--',
                ),
                AppRow(
                  text1: S.of(context).ozuqaNarxiSom,
                  text2: getCurrencySymbol(model?.totalPrice ?? 0),
                ),
                AppRow(
                  text1: S.of(context).osishMuddati,
                  text2: model?.growthPeriod?.toStringAsFixed(0) ?? '--',
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().move().fade().slideY(begin: 1, end: 0, duration: 200.ms);
  }
}
