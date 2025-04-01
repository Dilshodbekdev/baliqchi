import 'dart:convert';

import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_divider.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/core/util/funs.dart';
import 'package:baliqchi/src/features/economic/data/bodies/filter_body.dart';
import 'package:baliqchi/src/features/economic/data/models/expense_month_statistic_model.dart';
import 'package:baliqchi/src/features/economic/presentation/manager/economic_bloc.dart';
import 'package:baliqchi/src/features/economic/presentation/pages/widgets/details_economic_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pie_chart/pie_chart.dart';

class ExpenseMonthStatisticsPage extends StatefulWidget {
  const ExpenseMonthStatisticsPage({super.key});

  @override
  State<ExpenseMonthStatisticsPage> createState() =>
      _DetailsEconomicPageState();
}

class _DetailsEconomicPageState extends State<ExpenseMonthStatisticsPage> {
  late final bloc = context.read<EconomicBloc>();

  List<Color> colorList = [
    AppColors.amountFishColor,
    AppColors.foodPriceColor,
    AppColors.utilityBillsColor,
    AppColors.taxExpensesColor,
    AppColors.totalSalaryColor,
    AppColors.otherExpensesColor,
    AppColors.amountFishColor,
    AppColors.foodPriceColor,
    AppColors.utilityBillsColor,
    AppColors.taxExpensesColor,
    AppColors.totalSalaryColor,
    AppColors.otherExpensesColor
  ];

  @override
  void initState() {
    super.initState();
    bloc.expenseMonthStatistics(FilterBody());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).tahminiyIqtisodiyKorsatkichlar),
        actions: [
          IconButton(
              onPressed: () async {
               FilterBody? body = await context.pushNamed(AppRoutes.filter.name);
               if(body!=null){
                 bloc.expenseMonthStatistics(body);
               }
              }, icon: const Icon(Icons.filter_alt_outlined))
        ],
      ),
      body: BlocBuilder<EconomicBloc, EconomicState>(
        builder: (context, state) {
          return state.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.mainColor1,))
              : BlocBuilder<AppCubit, AppState>(
  builder: (context, appState) {
    return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(children: [
                    state.expenseMonthStatistics != null &&
                            state.expenseMonthStatistics?.isNotEmpty == true
                        ? AppContainer(
                            margin: EdgeInsets.zero,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                PieChart(
                                  dataMap: getData(
                                      state.expenseMonthStatistics ?? [],appState.lang),
                                  animationDuration:
                                      const Duration(milliseconds: 800),
                                  chartLegendSpacing: 32,
                                  chartRadius: 240,
                                  colorList: getColors(
                                      state.expenseMonthStatistics ?? []),
                                  initialAngleInDegree: 0,
                                  chartType: ChartType.ring,
                                  ringStrokeWidth: 28,
                                  legendOptions: const LegendOptions(
                                    showLegendsInRow: false,
                                    legendPosition: LegendPosition.bottom,
                                    showLegends: false,
                                    legendTextStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                    legendShape: BoxShape.circle,
                                  ),
                                  chartValuesOptions: const ChartValuesOptions(
                                    showChartValueBackground: true,
                                    showChartValues: true,
                                    showChartValuesInPercentage: true,
                                    showChartValuesOutside: true,
                                  ),
                                  // gradientList: ---To add gradient colors---
                                  // emptyColorGradient: ---Empty Color gradient---
                                ),
                                const SizedBox(height: 16),
                                const AppDivider(),
                                Column(
                                  children: List.generate(
                                      state.expenseMonthStatistics?.length ?? 0,
                                      (index) {
                                    return DetailsEconomicListTile(
                                      color: colorList[index],
                                      title: appState.lang=='uz'? (state.expenseMonthStatistics?[index].expenseTypeNameUz ?? '--'):(state.expenseMonthStatistics?[index].expenseTypeNameRu??'--'),
                                      currency: getCurrencySymbol(state
                                              .expenseMonthStatistics?[index]
                                              .expenseAmount
                                              ?.toDouble() ??
                                          0),
                                    );
                                  }),
                                )
                              ],
                            ),
                          )
                        : Center(
                            child: Text(
                              S.of(context).malumotTopilmadi,
                              style: const TextStyle(
                                color: Color(0xFF0F1728),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                  ]),
                );
  },
);
        },
      ),
    );
  }

  List<Color> getColors(List<ExpenseMonthStatisticModel> list) {
    debugPrint(jsonEncode(list));
    List<Color> colors = [];
    for (var i = 0; i < list.length; i++) {
      colors.add(colorList[i]);
    }
    //debugPrint(jsonEncode(colors));
    return colors;
  }

  Map<String, double> getData(List<ExpenseMonthStatisticModel> list,String lang) {
    debugPrint(jsonEncode(list));
    Map<String, double> peopleMap = {
      for (var e in list)
        (lang=='uz'? e.expenseTypeNameUz ?? '--':e.expenseTypeNameRu ?? '--'): e.expenseAmount?.toDouble() ?? 0
    };
    debugPrint(jsonEncode(peopleMap));
    return peopleMap;
  }
}
