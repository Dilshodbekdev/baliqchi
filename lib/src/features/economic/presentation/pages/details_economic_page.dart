import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_divider.dart';
import 'package:baliqchi/src/config/components/text_field_components.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/core/util/funs.dart';
import 'package:baliqchi/src/features/economic/presentation/manager/economic_bloc.dart';
import 'package:baliqchi/src/features/economic/presentation/pages/widgets/details_economic_list_tile.dart';
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_input_formatter/money_input_formatter.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DetailsEconomicPage extends StatefulWidget {
  final String id;

  const DetailsEconomicPage({super.key, required this.id});

  @override
  State<DetailsEconomicPage> createState() => _DetailsEconomicPageState();
}

class _DetailsEconomicPageState extends State<DetailsEconomicPage> {
  late final bloc = context.read<EconomicBloc>();

  final form = FormGroup({
    'price': FormControl<String>(validators: [
      Validators.required,
    ]),
  });

  FormControl<String> get price => form.control('price') as FormControl<String>;

  @override
  void initState() {
    super.initState();
    bloc.detailsEconomic(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).tahminiyIqtisodiyKorsatkichlar),
      ),
      body: BlocBuilder<EconomicBloc, EconomicState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              AppContainer(
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    PieChart(
                      dataMap: {
                        S.of(context).tashalayotganBaliqlarNarxi: state.detailsEconomicModel?.fishPrice?.toDouble() ?? 0,
                        S.of(context).ozuqagaSarflanganHarajat: state.detailsEconomicModel?.totalFoodPrice ?? 0,
                        S.of(context).kamunalTolovlar: state.detailsEconomicModel?.utilityBills ?? 0,
                        S.of(context).soliqHarajatlari: state.detailsEconomicModel?.taxExpenses ?? 0,
                        S.of(context).jamiIshchilarOyligi: state.detailsEconomicModel?.totalSalary ?? 0,
                        S.of(context).boshqaHarajatlar: state.detailsEconomicModel?.otherExpenses ?? 0,
                      },
                      animationDuration: const Duration(milliseconds: 800),
                      chartLegendSpacing: 32,
                      chartRadius: 240,
                      colorList: const [
                        AppColors.amountFishColor,
                        AppColors.foodPriceColor,
                        AppColors.utilityBillsColor,
                        AppColors.taxExpensesColor,
                        AppColors.totalSalaryColor,
                        AppColors.otherExpensesColor
                      ],
                      initialAngleInDegree: 0,
                      chartType: ChartType.ring,
                      ringStrokeWidth: 28,
                      centerText: getCurrencySymbol(
                          state.detailsEconomicModel?.totalExpense ?? 0),
                      centerTextStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
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
                    DetailsEconomicListTile(
                      color: AppColors.amountFishColor,
                      title: S.of(context).tashalayotganBaliqlarNarxi,
                      currency: getCurrencySymbol(
                          state.detailsEconomicModel?.fishPrice ?? 0),
                    ),
                    DetailsEconomicListTile(
                      color: AppColors.foodPriceColor,
                      title: S.of(context).ozuqagaSarflanganHarajat,
                      currency: getCurrencySymbol(
                          state.detailsEconomicModel?.totalFoodPrice ?? 0),
                    ),
                    DetailsEconomicListTile(
                        color: AppColors.utilityBillsColor,
                        title: S.of(context).kamunalTolovlar,
                        currency: getCurrencySymbol(
                            state.detailsEconomicModel?.utilityBills ?? 0)),
                    DetailsEconomicListTile(
                      color: AppColors.taxExpensesColor,
                      title: S.of(context).soliqHarajatlari,
                      currency: getCurrencySymbol(
                          state.detailsEconomicModel?.taxExpenses ?? 0),
                    ),
                    DetailsEconomicListTile(
                      color: AppColors.totalSalaryColor,
                      title: S.of(context).jamiIshchilarOyligi,
                      currency: getCurrencySymbol(
                          state.detailsEconomicModel?.totalSalary ?? 0),
                    ),
                    DetailsEconomicListTile(
                      color: AppColors.otherExpensesColor,
                      title: S.of(context).boshqaHarajatlar,
                      currency: getCurrencySymbol(
                          state.detailsEconomicModel?.otherExpenses ?? 0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              ReactiveForm(
                formGroup: form,
                child: AppContainer(
                  margin: EdgeInsets.zero,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              S.of(context).sotishRejalashtirilganBaliqNarxiSom,
                              style: CustomTextStyle.h16M,
                            ),
                          ),
                          Text(
                            getCurrencySymbol(
                                state.detailsEconomicModel?.plannedPriceFish ??
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
                              formControl: price,
                              decoration: InputDecoration(
                                isDense: true,
                                errorStyle: const TextStyle(height: 0.001),
                                errorText: null,
                                hintText: S.of(context).baliqNarxi,
                                hintStyle: CustomTextStyle.hint,
                                border: appTextFiledBorder(),
                                enabledBorder: appTextFiledBorder(),
                                disabledBorder: appTextFiledBorder(),
                                focusedBorder: appTextFiledBorder(),
                                errorBorder: appTextFiledErrorBorder(),
                              ),
                              validationMessages: {
                                'required': (error) => '',
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                MoneyInputFormatter()
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          ReactiveFormConsumer(builder: (context, form, child) {
                            return SizedBox(
                              height: 48,
                              width: 56,
                              child: IconButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.mainColor2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (form.valid) {
                                      bloc.updateEconomic(PagingBody(
                                          id: widget.id,
                                          price: double.parse(price.value
                                                  ?.replaceAll(' ', '') ??
                                              '0')));
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
                ),
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        AppContainer(
                          margin: EdgeInsets.zero,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.pie_chart_outline,
                                color: AppColors.mainColor2,
                              ),
                              Text(
                                S.of(context).ummumiyHarajatlar,
                                style: CustomTextStyle.hint,
                              ),
                              Text(
                                getCurrencySymbol((state
                                            .detailsEconomicModel?.fishPrice ??
                                        0) +
                                    (state.detailsEconomicModel
                                            ?.totalFoodPrice ??
                                        0) +
                                    (state.detailsEconomicModel?.utilityBills ??
                                        0) +
                                    (state.detailsEconomicModel?.taxExpenses ??
                                        0) +
                                    (state.detailsEconomicModel?.totalSalary ??
                                        0) +
                                    (state.detailsEconomicModel?.otherExpenses ??
                                        0)),
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        AppContainer(
                          margin: EdgeInsets.zero,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.waterfall_chart_outlined,
                                color: AppColors.mainColor2,
                              ),
                              Text(
                                S.of(context).daromad,
                                style: CustomTextStyle.hint,
                              ),
                              Text(
                                getCurrencySymbol(
                                    state.detailsEconomicModel?.income ?? 0),
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      children: [
                        AppContainer(
                          margin: EdgeInsets.zero,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.add_chart,
                                color: AppColors.mainColor2,
                              ),
                              Text(
                                S.of(context).foyda,
                                style: CustomTextStyle.hint,
                              ),
                              Text(
                                getCurrencySymbol((state.detailsEconomicModel?.income ?? 0)-((state
                                    .detailsEconomicModel?.fishPrice ??
                                    0) +
                                    (state.detailsEconomicModel
                                        ?.totalFoodPrice ??
                                        0) +
                                    (state.detailsEconomicModel?.utilityBills ??
                                        0) +
                                    (state.detailsEconomicModel?.taxExpenses ??
                                        0) +
                                    (state.detailsEconomicModel?.totalSalary ??
                                        0) +
                                    (state.detailsEconomicModel?.otherExpenses ??
                                        0))),
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        AppContainer(
                          margin: EdgeInsets.zero,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.filter_sharp,
                                color: AppColors.mainColor2,
                              ),
                              Text(
                                S.of(context).KgBaliqningTanNarxi,
                                style: CustomTextStyle.hint,
                              ),
                              Text(
                                getCurrencySymbol(
                                    state.detailsEconomicModel?.priceKgFish ??
                                        0),
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ]),
          );
        },
      ),
    );
  }
}
